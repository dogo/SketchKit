#if canImport(AppKit) && !canImport(UIKit)
import AppKit
import XCTest

@testable import SketchKit

final class AppKitLayoutTests: XCTestCase {

    private var container: View!
    private var child: View!

    override func setUp() {
        super.setUp()

        container = View(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        child = View(frame: .zero)
        container.addSubview(child)
    }

    override func tearDown() {
        child = nil
        container = nil

        super.tearDown()
    }

    func testViewLayoutAppliesConstraintsAndDisablesAutoresizingMask() {
        var topConstraint: NSLayoutConstraint?
        var leadingConstraint: NSLayoutConstraint?

        child.layout.applyConstraint { view in
            topConstraint = view.topAnchor(equalTo: container.topAnchor, constant: 12)
            leadingConstraint = view.leadingAnchor(equalTo: container.leadingAnchor, constant: 8)
        }

        XCTAssertFalse(child.translatesAutoresizingMaskIntoConstraints)
        XCTAssertTrue(topConstraint?.isActive ?? false)
        XCTAssertEqual(topConstraint?.constant, 12)
        XCTAssertTrue(leadingConstraint?.isActive ?? false)
        XCTAssertEqual(leadingConstraint?.constant, 8)
    }

    func testLayoutGuideLayoutAppliesConstraints() {
        let layoutGuide = LayoutGuide()
        container.addLayoutGuide(layoutGuide)

        var widthConstraint: NSLayoutConstraint?

        layoutGuide.layout.applyConstraint { guide in
            widthConstraint = guide.widthAnchor(equalToConstant: 44)
        }

        XCTAssertTrue(widthConstraint?.isActive ?? false)
        XCTAssertEqual(widthConstraint?.constant, 44)
    }
}
#endif
