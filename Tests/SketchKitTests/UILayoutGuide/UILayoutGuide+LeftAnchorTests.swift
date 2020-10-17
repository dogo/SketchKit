//
//  UILayoutGuide+LeftAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_LeftAnchorTests: XCTestCase {

    var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - LeftAnchor equalTo

    func testLeftAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.leftAnchor(equalTo: scrollView.leftAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .left, "Should be left")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - LeftAnchor greaterThanOrEqualTo

    func testLeftAnchorGreaterThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.leftAnchor(greaterThanOrEqualTo: scrollView.leftAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .left, "Should be left")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - LeftAnchor lessThanOrEqualTo

    func testLeftAnchorLessThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.leftAnchor(lessThanOrEqualTo: scrollView.leftAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .left, "Should be left")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testLeftAnchor", testLeftAnchor),
        ("testLeftAnchorGreaterThanOrEqualTo", testLeftAnchorGreaterThanOrEqualTo),
        ("testLeftAnchorLessThanOrEqualTo", testLeftAnchorLessThanOrEqualTo)
    ]
}

