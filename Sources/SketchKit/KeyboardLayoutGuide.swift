//
//  KeyboardLayoutGuide.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2021 Anykey Entertrainment. All rights reserved.
//

import Foundation
import UIKit

final class SKKeyboard {
    static let shared = SKKeyboard()
    var currentHeight: CGFloat = 0

    private init() {
        // Safe singleton pattern
    }
}

final class KeyboardLayoutGuide: LayoutGuide {

    private var bottomConstraint: NSLayoutConstraint?

    init(notificationCenter: NotificationCenter = NotificationCenter.default) {
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
        NotificationCenter.default.removeObserver(self)
    }

    /// Sets up the layout guide's initial constraints.
    func setUp() {
        guard let owningView else { return }

        // Apply height, left, and right constraints
        self.layout.applyConstraint {
            $0.heightAnchor(equalToConstant: SKKeyboard.shared.currentHeight)
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
        if var height = notification.keyboardHeight, let duration = notification.animationDuration {
            if height > 0, let bottom = owningView?.safeAreaInsets.bottom {
                height -= bottom
            }
            heightConstraint?.constant = height
            if duration > 0.0 {
                animate(notification)
            }
            SKKeyboard.shared.currentHeight = height
        }
    }

    /// Animates the layout changes when the keyboard frame changes.
    private func animate(_ notification: Notification) {
        if let owningView, isVisible(view: owningView) {
            owningView.layoutIfNeeded()
        } else {
            UIView.performWithoutAnimation { [weak self] in
                self?.owningView?.layoutIfNeeded()
            }
        }
    }

    /// Checks if the view is visible in the current view hierarchy.
    private func isVisible(view: UIView) -> Bool {
        func isVisible(view: UIView, inView: UIView?) -> Bool {
            guard let inView else { return true }
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

extension Notification {
    /// Retrieves the keyboard's height from the notification's userInfo.
    var keyboardHeight: CGFloat? {
        guard let keyboardFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return nil
        }

        if name == UIResponder.keyboardWillHideNotification {
            return 0.0
        } else {
            // Keyboard frame behaves differently across iOS versions, so we calculate based on screen height.
            let screenHeight = UIApplication.shared.keyWindow?.bounds.height ?? UIScreen.main.bounds.height
            return screenHeight - keyboardFrame.cgRectValue.minY
        }
    }

    /// Retrieves the keyboard's animation duration from the notification's userInfo.
    var animationDuration: CGFloat? {
        return self.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? CGFloat
    }
}
