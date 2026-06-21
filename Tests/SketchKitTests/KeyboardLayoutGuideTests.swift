#if os(iOS)
//
//  KeyboardLayoutGuideTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 22/09/24.
//

import XCTest

@testable import SketchKit

final class KeyboardLayoutGuideTests: XCTestCase {

    private var sut: KeyboardLayoutGuide!
    private var mockView: UIView!

    override func setUp() {
        super.setUp()
        mockView = UIView(frame: UIScreen.main.bounds)
        sut = KeyboardLayoutGuide()

        mockView.addLayoutGuide(sut)
    }

    override func tearDown() {
        sut = nil
        mockView = nil
        SKKeyboard.shared.lastKeyboardFrame = nil
        super.tearDown()
    }

    func testSetUp_AppliesConstraintsCorrectly() {
        sut.setUp()

        let heightConstraint = sut.heightConstraint
        XCTAssertNotNil(heightConstraint, "Height constraint should be applied")
        XCTAssertEqual(
            heightConstraint?.constant,
            0,
            "Height constraint should start at 0 when no keyboard frame has been cached"
        )

        XCTAssertTrue(mockView.constraints.contains {
            $0.firstAnchor == sut.leftAnchor && $0.secondAnchor == mockView.leftAnchor
        }, "Left constraint should be applied between the layout guide and the owning view")

        XCTAssertTrue(mockView.constraints.contains {
            $0.firstAnchor == sut.rightAnchor && $0.secondAnchor == mockView.rightAnchor
        }, "Right constraint should be applied between the layout guide and the owning view")

        XCTAssertNotNil(sut.bottomConstraint, "Bottom constraint should be updated")
        XCTAssertEqual(
            sut.bottomConstraint?.firstAnchor,
            sut.bottomAnchor,
            "Bottom constraint should anchor to the layout guide's bottomAnchor"
        )
        XCTAssertEqual(
            sut.bottomConstraint?.secondAnchor,
            mockView.safeBottomAnchor,
            "Bottom constraint should anchor to the view's safeBottomAnchor"
        )
    }

    func testKeyboardLayout_CreatesAndConfiguresGuide() {
        let view = UIView(frame: UIScreen.main.bounds)

        let keyboardLayout = view.keyboardLayout

        XCTAssertTrue(
            keyboardLayout is KeyboardLayoutGuide,
            "The public keyboardLayout getter should create a KeyboardLayoutGuide"
        )
        XCTAssertEqual(
            keyboardLayout.identifier,
            "KeyboardLayoutGuide",
            "The layout guide should be identifiable for later reuse"
        )
        XCTAssertTrue(
            view.layoutGuides.contains { $0 === keyboardLayout },
            "The keyboard layout guide should be attached to the view"
        )
        XCTAssertNotNil(
            keyboardLayout.heightConstraint,
            "The keyboard layout guide should be configured with a height constraint"
        )
    }

    func testKeyboardLayout_ReusesExistingGuide() {
        let view = UIView(frame: UIScreen.main.bounds)

        let firstKeyboardLayout = view.keyboardLayout
        let secondKeyboardLayout = view.keyboardLayout

        XCTAssertTrue(
            firstKeyboardLayout === secondKeyboardLayout,
            "The public keyboardLayout getter should reuse an existing guide"
        )
        XCTAssertEqual(
            view.layoutGuides.filter { $0.identifier == "KeyboardLayoutGuide" }.count,
            1,
            "The view should not accumulate duplicate keyboard layout guides"
        )
    }

    func testAdjustKeyboardWhenKeyboardWillShow() {
        sut.setUp()

        XCTAssertEqual(sut.heightConstraint?.constant, 0, "The initial keyboard height should be 0")

        let screenHeight = UIScreen.main.bounds.height

        // Simulate the keyboard showing, with a height of 216
        let keyboardFrame = CGRect(x: 0, y: screenHeight - 216, width: 320, height: 216)
        let notification = Notification(name: UIResponder.keyboardWillChangeFrameNotification, object: nil, userInfo: [
            UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: keyboardFrame),
            UIResponder.keyboardAnimationDurationUserInfoKey: CGFloat(0.25)
        ])

        NotificationCenter.default.post(notification)

        let expectedHeight = screenHeight - keyboardFrame.minY // Should be 216
        XCTAssertEqual(
            SKKeyboard.shared.lastKeyboardFrame,
            keyboardFrame,
            "SKKeyboard.shared should cache the raw keyboard frame in screen coordinates"
        )

        XCTAssertEqual(
            sut.heightConstraint?.constant,
            expectedHeight,
            "The height constraint should be properly adjusted based on the keyboard height"
        )
    }

    func testSetUp_RecomputesHeightForOwnView_WhenKeyboardAlreadyVisible() {
        // The first guide observes the keyboard and caches its frame.
        sut.setUp()

        let screenHeight = UIScreen.main.bounds.height
        let keyboardFrame = CGRect(x: 0, y: screenHeight - 216, width: 320, height: 216)
        let notification = Notification(name: UIResponder.keyboardWillChangeFrameNotification, object: nil, userInfo: [
            UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: keyboardFrame),
            UIResponder.keyboardAnimationDurationUserInfoKey: CGFloat(0.25)
        ])
        NotificationCenter.default.post(notification)

        XCTAssertEqual(sut.heightConstraint?.constant, 216, "The original guide should reflect the keyboard height for its own view")

        // A second guide attaches to a shorter view *after* the keyboard is already shown.
        // It must compute its height against its own view, not inherit the first view's 216.
        let shorterView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: screenHeight - 100))
        let secondGuide = KeyboardLayoutGuide()
        shorterView.addLayoutGuide(secondGuide)

        secondGuide.setUp()

        let expectedShorterHeight = (screenHeight - 100) - keyboardFrame.minY // 116
        XCTAssertEqual(
            secondGuide.heightConstraint?.constant,
            expectedShorterHeight,
            "A guide attached after the keyboard is shown should recompute against its own owningView"
        )
    }

    func testAdjustKeyboard_UsesWindowConversion_WhenViewIsHostedInWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.addSubview(mockView)
        sut.setUp()

        let screenHeight = UIScreen.main.bounds.height
        let keyboardFrame = CGRect(x: 0, y: screenHeight - 216, width: 320, height: 216)
        let notification = Notification(name: UIResponder.keyboardWillChangeFrameNotification, object: nil, userInfo: [
            UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: keyboardFrame),
            UIResponder.keyboardAnimationDurationUserInfoKey: CGFloat(0.25)
        ])

        NotificationCenter.default.post(notification)

        let expectedHeight = 216 - mockView.safeAreaInsets.bottom
        XCTAssertEqual(
            SKKeyboard.shared.lastKeyboardFrame,
            keyboardFrame,
            "The raw keyboard frame should be cached when the view has a window"
        )
        XCTAssertEqual(
            sut.heightConstraint?.constant,
            expectedHeight,
            "The height constraint should reflect the window-converted keyboard intersection"
        )
    }

    func testAdjustKeyboard_FloatingKeyboard_ComputesHeightFromKeyboardTop() {
        sut.setUp()

        let screenHeight = UIScreen.main.bounds.height
        // Floating keyboard: its top is 400pt from the bottom of the view, and it does not
        // extend down to the view's bottom edge.
        let floatingKeyboardTop = screenHeight - 400
        let keyboardFrame = CGRect(x: 50, y: floatingKeyboardTop, width: 320, height: 290)
        let notification = Notification(name: UIResponder.keyboardWillChangeFrameNotification, object: nil, userInfo: [
            UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: keyboardFrame),
            UIResponder.keyboardAnimationDurationUserInfoKey: CGFloat(0.25)
        ])

        NotificationCenter.default.post(notification)

        XCTAssertEqual(
            SKKeyboard.shared.lastKeyboardFrame,
            keyboardFrame,
            "The raw floating keyboard frame should be cached in screen coordinates"
        )
        XCTAssertEqual(
            sut.heightConstraint?.constant,
            400,
            "The height constraint should lift content above the floating keyboard"
        )
    }

    func testAdjustKeyboardWhenKeyboardWillHide() {
        sut.setUp()

        // First show the keyboard so there is a non-zero state to reset.
        let screenHeight = UIScreen.main.bounds.height
        let keyboardFrame = CGRect(x: 0, y: screenHeight - 216, width: 320, height: 216)
        let showNotification = Notification(
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            userInfo: [
                UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: keyboardFrame),
                UIResponder.keyboardAnimationDurationUserInfoKey: CGFloat(0.25)
            ]
        )
        NotificationCenter.default.post(showNotification)
        XCTAssertEqual(sut.heightConstraint?.constant, 216, "Precondition: the keyboard should be shown")

        let hideNotification = Notification(
            name: UIResponder.keyboardWillHideNotification,
            object: nil,
            userInfo: [
                UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: keyboardFrame),
                UIResponder.keyboardAnimationDurationUserInfoKey: CGFloat(0.25)
            ]
        )
        NotificationCenter.default.post(hideNotification)

        XCTAssertNil(
            SKKeyboard.shared.lastKeyboardFrame,
            "The cached keyboard frame should be cleared when the keyboard hides"
        )

        XCTAssertEqual(
            sut.heightConstraint?.constant,
            0,
            "The height constraint should be reset to 0 when the keyboard hides"
        )
    }

    func testAnimationCurve_TranslatesKeyboardCurveToAnimationOptions() {
        let notification = Notification(
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            userInfo: [UIResponder.keyboardAnimationCurveUserInfoKey: UInt(7)]
        )

        XCTAssertEqual(
            notification.animationCurve,
            UIView.AnimationOptions(rawValue: UInt(7) << 16),
            "The keyboard animation curve should be shifted into the AnimationOptions bit field"
        )
    }

    func testAnimationCurve_DefaultsToEaseInOut_WhenAbsent() {
        let notification = Notification(
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            userInfo: nil
        )

        XCTAssertEqual(
            notification.animationCurve,
            .curveEaseInOut,
            "The animation curve should fall back to easeInOut when the notification omits it"
        )
    }

    func testDeinit_RemovesObserversFromInjectedNotificationCenter() {
        let notificationCenter = NotificationCenterSpy()
        var guide: KeyboardLayoutGuide? = KeyboardLayoutGuide(notificationCenter: notificationCenter)
        let expectedObserverIdentifier = guide.map { ObjectIdentifier($0) }

        guide = nil

        XCTAssertEqual(
            notificationCenter.removeObserverCallCount,
            1,
            "The guide should remove itself from its injected notification center"
        )
        XCTAssertEqual(
            notificationCenter.removedObserverIdentifier,
            expectedObserverIdentifier,
            "The removed observer should be the deallocated guide"
        )
    }
}

private final class NotificationCenterSpy: NotificationCenter {

    private(set) var removeObserverCallCount = 0
    private(set) var removedObserverIdentifier: ObjectIdentifier?

    override func removeObserver(_ observer: Any) {
        removeObserverCallCount += 1

        if let observer = observer as? AnyObject {
            removedObserverIdentifier = ObjectIdentifier(observer)
        }

        super.removeObserver(observer)
    }
}

#endif
