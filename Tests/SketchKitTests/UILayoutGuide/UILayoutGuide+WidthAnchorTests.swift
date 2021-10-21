//
//  UILayoutGuide+WidthAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_WidthAnchorTests: XCTestCase {

    private var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - WidthAnchor equalTo

    func testWidthAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.widthAnchor(equalToConstant: 20)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(constraints[0].firstAttribute, .width, "Should be width")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - WidthAnchor greaterThanOrEqualToConstant

    func testWidthAnchorGreaterThanOrEqualToConstant() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.widthAnchor(greaterThanOrEqualToConstant: 20)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .width, "Should be width")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - WidthAnchor lessThanOrEqualToConstant

    func testWidthAnchorLessThanOrEqualToConstant() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.widthAnchor(lessThanOrEqualToConstant: 20)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(constraints[0].firstAttribute, .width, "Should be width")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    // MARK: - WidthAnchor equalTo

    func testWidthAnchorEqualTo() {

        let containerLayoutGuide = UILayoutGuide()

        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.widthAnchor(equalTo: scrollView.widthAnchor)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].firstAttribute, .width, "Should be width")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - WidthAnchor greaterThanOrEqualTo

    func testWidthAnchorGreaterThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.widthAnchor(greaterThanOrEqualTo: scrollView.widthAnchor)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].firstAttribute, .width, "Should be width")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - WidthAnchor lessThanOrEqualTo

    func testWidthAnchorLessThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.widthAnchor(lessThanOrEqualTo: scrollView.widthAnchor)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].firstAttribute, .width, "Should be width")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testWidthAnchor", testWidthAnchor),
        ("testWidthAnchorGreaterThanOrEqualToConstant", testWidthAnchorGreaterThanOrEqualToConstant),
        ("testWidthAnchorLessThanOrEqualToConstant", testWidthAnchorLessThanOrEqualToConstant),
        ("testWidthAnchorEqualTo", testWidthAnchorEqualTo),
        ("testWidthAnchorGreaterThanOrEqualTo", testWidthAnchorGreaterThanOrEqualTo),
        ("testWidthAnchorLessThanOrEqualTo", testWidthAnchorLessThanOrEqualTo)
    ]
}
