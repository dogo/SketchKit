//
//  KeyboardLayoutGuide.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2021 Anykey Entertrainment. All rights reserved.
//

#if os(iOS)
import Foundation
import UIKit

/// Caches the last keyboard end frame (screen coordinates) per scene, so a guide attached
/// while the keyboard is already visible can seed its initial height in `setUp()`.
///
/// The frame is stored per `UIWindowScene`, keyed weakly so entries are purged when a scene
/// is torn down, instead of in a single global slot. A global value would be both
/// view-relative-wrong (the original bug) and scene-wrong: in a multi-scene app one scene's
/// keyboard frame would otherwise leak into another scene's guide. Scenes don't exist before
/// iOS 13, so those builds fall back to a single slot.
final class SKKeyboard {
    static let shared = SKKeyboard()

    private let framesByScene = NSMapTable<AnyObject, NSValue>(keyOptions: .weakMemory, valueOptions: .strongMemory)
    private var fallbackFrame: CGRect?

    private init() {
        // Safe singleton pattern
    }

    /// The last keyboard frame seen for `scene`, or `nil` if the keyboard is hidden /
    /// unobserved for it. Pass `nil` for the pre-iOS 13 / sceneless fallback slot.
    func lastKeyboardFrame(for scene: AnyObject?) -> CGRect? {
        guard let scene else { return fallbackFrame }
        return framesByScene.object(forKey: scene)?.cgRectValue
    }

    /// Stores `frame` (screen coordinates) for `scene`, or clears it when `frame` is `nil`.
    func setLastKeyboardFrame(_ frame: CGRect?, for scene: AnyObject?) {
        guard let scene else {
            fallbackFrame = frame
            return
        }
        if let frame {
            framesByScene.setObject(NSValue(cgRect: frame), forKey: scene)
        } else {
            framesByScene.removeObject(forKey: scene)
        }
    }
}

final class KeyboardLayoutGuide: LayoutGuide {

    private var bottomConstraint: NSLayoutConstraint?
    private let notificationCenter: NotificationCenter

    init(notificationCenter: NotificationCenter = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
        super.init()

        // Observe keyboardWillChangeFrame notifications
        notificationCenter.addObserver(
            self,
            selector: #selector(adjustKeyboard(_:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )

        // Observe keyboardWillHide notifications
        notificationCenter.addObserver(
            self,
            selector: #selector(adjustKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    /// Sets up the layout guide's initial constraints.
    func setUp() {
        guard let owningView = owningView else { return }

        // Recompute the initial height against this guide's own owningView from the last
        // keyboard frame cached for its scene, so a guide attached while the keyboard is
        // already visible starts at the correct height for its view rather than a stale value.
        let initialHeight = SKKeyboard.shared.lastKeyboardFrame(for: owningScene)
            .map { owningView.keyboardLayoutGuideHeight(forKeyboardFrame: $0) } ?? 0.0

        // Apply height, left, and right constraints
        self.layout.applyConstraint {
            $0.heightAnchor(equalToConstant: initialHeight)
            $0.leftAnchor(equalTo: owningView.leftAnchor)
            $0.rightAnchor(equalTo: owningView.rightAnchor)
        }

        bottomConstraint?.isActive = false
        bottomConstraint = bottomAnchor.constraint(equalTo: owningView.safeBottomAnchor)
        bottomConstraint?.isActive = true
    }

    /// Adjusts the layout guide's height based on the keyboard's frame.
    @objc
    private func adjustKeyboard(_ notification: Notification) {
        guard shouldHandle(notification), let duration = notification.animationDuration else { return }

        let keyboardFrame: CGRect?
        if notification.name == UIResponder.keyboardWillHideNotification {
            keyboardFrame = nil
        } else if let frame = notification.keyboardFrameEnd {
            keyboardFrame = frame
        } else {
            // Malformed notification without a frame; leave existing state untouched.
            return
        }

        // Cache the raw frame (screen coordinates) for this guide's scene so guides attached
        // later can recompute against their own owningView. `nil` means the keyboard is hidden.
        SKKeyboard.shared.setLastKeyboardFrame(keyboardFrame, for: owningScene)

        guard let owningView = owningView else { return }

        heightConstraint?.constant = keyboardFrame
            .map { owningView.keyboardLayoutGuideHeight(forKeyboardFrame: $0) } ?? 0.0

        if duration > 0.0 {
            animate(duration: TimeInterval(duration), options: notification.animationCurve)
        }
    }

    /// Animates the layout changes so the guide tracks the system keyboard's timing,
    /// using the duration and curve reported in the keyboard notification.
    private func animate(duration: TimeInterval, options: UIView.AnimationOptions) {
        if let owningView = owningView, isVisible(view: owningView) {
            UIView.animate(withDuration: duration, delay: 0, options: options) {
                owningView.layoutIfNeeded()
            }
        } else {
            UIView.performWithoutAnimation { [weak self] in
                self?.owningView?.layoutIfNeeded()
            }
        }
    }

    /// Decides whether a keyboard notification targets this guide's scene. Multi-scene
    /// apps (Split View, Slide Over, Stage Manager) receive notifications for keyboards
    /// hosted in other scenes/apps; converting those frames through this guide's window
    /// would be meaningless, so they are ignored.
    private func shouldHandle(_ notification: Notification) -> Bool {
        // Ignore keyboards belonging to another app sharing the screen.
        if let isLocal = notification.userInfo?[UIResponder.keyboardIsLocalUserInfoKey] as? Bool, !isLocal {
            return false
        }

        // Ignore keyboards reported on a different screen than the one hosting the guide.
        if #available(iOS 13.0, *), notificationTargetsForeignScreen(notification) {
            return false
        }

        return true
    }

    /// The scene hosting this guide, used to key the per-scene keyboard cache. `nil` before
    /// iOS 13 (no scenes) or while the guide isn't in a window.
    private var owningScene: AnyObject? {
        if #available(iOS 13.0, *) {
            return owningView?.window?.windowScene
        }
        return nil
    }

    @available(iOS 13.0, *)
    private func notificationTargetsForeignScreen(_ notification: Notification) -> Bool {
        guard let notificationScreen = notification.object as? UIScreen,
              let guideScreen = owningView?.window?.windowScene?.screen else {
            // No screen to compare against, so fall through and handle the notification.
            return false
        }
        return notificationScreen !== guideScreen
    }

    /// Checks if the view is visible in the current view hierarchy.
    private func isVisible(view: UIView) -> Bool {
        func isVisible(view: UIView, inView: UIView?) -> Bool {
            guard let inView = inView else { return true }
            let viewFrame = inView.convert(view.bounds, from: view)
            if viewFrame.intersects(inView.bounds) {
                return isVisible(view: view, inView: inView.superview)
            }
            return false
        }
        return isVisible(view: view, inView: view.superview)
    }
}

// MARK: - Helpers

extension LayoutGuide {
    /// Finds the height constraint for the layout guide if it exists.
    var heightConstraint: NSLayoutConstraint? {
        return owningView?.constraints.first {
            $0.firstItem as? UILayoutGuide == self && $0.firstAttribute == .height
        }
    }
}

extension UIView {
    /// Height the keyboard layout guide should adopt for a keyboard end frame given in
    /// screen coordinates. The frame is converted into this view's coordinate space, the
    /// overlap is measured from the view's bottom up to the keyboard's top, so the guide
    /// pushes content above the keyboard even when it is floating/undocked and the bottom
    /// safe-area inset is removed.
    func keyboardLayoutGuideHeight(forKeyboardFrame keyboardFrame: CGRect) -> CGFloat {
        let keyboardFrameInView = convertedKeyboardFrame(keyboardFrame)
        let distanceFromBottom = bounds.maxY - keyboardFrameInView.minY
        var height = max(0.0, min(distanceFromBottom, bounds.height))

        if #available(iOS 11.0, *), height > 0 {
            height -= safeAreaInsets.bottom
        }

        return max(0.0, height)
    }

    private func convertedKeyboardFrame(_ keyboardFrame: CGRect) -> CGRect {
        guard let window = window else {
            return convert(keyboardFrame, from: nil)
        }

        let keyboardFrameInWindow = window.convert(keyboardFrame, from: nil)
        return convert(keyboardFrameInWindow, from: window)
    }
}

extension Notification {
    /// The keyboard's end frame in screen coordinates from the notification's userInfo,
    /// or `nil` when absent.
    var keyboardFrameEnd: CGRect? {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }

    /// Retrieves the keyboard's animation duration from the notification's userInfo.
    var animationDuration: CGFloat? {
        return self.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? CGFloat
    }

    /// The keyboard's animation curve translated to `UIView.AnimationOptions`, so the
    /// guide eases on the same spring as the system keyboard. Falls back to `.curveEaseInOut`
    /// when the notification omits the curve. The raw curve is shifted left by 16 bits to
    /// line up with the option's bit field.
    var animationCurve: UIView.AnimationOptions {
        guard let curve = userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {
            return .curveEaseInOut
        }
        return UIView.AnimationOptions(rawValue: curve << 16)
    }
}
#endif
