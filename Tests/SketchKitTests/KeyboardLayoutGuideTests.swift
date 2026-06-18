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
        SKKeyboard.shared.currentHeight = 0
        super.tearDown()
    }

    func testSetUp_AppliesConstraintsCorrectly() {
        sut.setUp()

        let heightConstraint = sut.heightConstraint
        XCTAssertNotNil(heightConstraint, "Height constraint should be applied")
        XCTAssertEqual(
            heightConstraint?.constant,
            0,
            "Height constraint should match the SKKeyboard.shared.currentHeight"
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

        XCTAssertEqual(SKKeyboard.shared.currentHeight, 0, "The initial keyboard height should be 0")

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
            SKKeyboard.shared.currentHeight,
            expectedHeight,
            "SKKeyboard.shared.currentHeight should be properly updated with the keyboard notification"
        )

        XCTAssertEqual(
            sut.heightConstraint?.constant,
            expectedHeight,
            "The height constraint should be properly adjusted based on the keyboard height"
        )
    }

    func testAdjustKeyboardWhenKeyboardWillHide() {
        sut.setUp()

        let notification = Notification(name: UIResponder.keyboardWillHideNotification, object: nil, userInfo: nil)

        NotificationCenter.default.post(notification)

        XCTAssertEqual(
            SKKeyboard.shared.currentHeight,
            0,
            "SKKeyboard.shared.currentHeight should be reset to 0 when the keyboard hides"
        )

        XCTAssertEqual(
            sut.heightConstraint?.constant,
            0,
            "The height constraint should be reset to 0 when the keyboard hides"
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
