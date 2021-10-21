//
//  UILayoutGuide+RightAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_RightAnchorTests: XCTestCase {

    private var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - RightAnchor equalTo

    func testRightAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.rightAnchor(equalTo: scrollView.rightAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .right, "Should be right")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - RightAnchor greaterThanOrEqualTo

    func testRightAnchorGreaterThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.rightAnchor(greaterThanOrEqualTo: scrollView.rightAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .right, "Should be right")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - RightAnchor lessThanOrEqualTo

    func testRightAnchorLessThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.rightAnchor(lessThanOrEqualTo: scrollView.rightAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .right, "Should be right")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testRightAnchor", testRightAnchor),
        ("testRightAnchorGreaterThanOrEqualTo", testRightAnchorGreaterThanOrEqualTo),
        ("testRightAnchorLessThanOrEqualTo", testRightAnchorLessThanOrEqualTo)
    ]
}
