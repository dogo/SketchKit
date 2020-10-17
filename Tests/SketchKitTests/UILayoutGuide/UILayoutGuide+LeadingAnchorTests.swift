//
//  UILayoutGuide+LeadingAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_LeadingAnchorTests: XCTestCase {

    var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - LeadingAnchor equalTo

    func testLeadingAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.leadingAnchor(equalTo: scrollView.leadingAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .leading, "Should be leading")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - LeadingAnchor greaterThanOrEqualTo

    func testLeadingAnchorGreaterThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.leadingAnchor(greaterThanOrEqualTo: scrollView.leadingAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .leading, "Should be leading")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - LeadingAnchor lessThanOrEqualTo

    func testLeadingAnchorLessThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.leadingAnchor(lessThanOrEqualTo: scrollView.leadingAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .leading, "Should be leading")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testLeadingAnchor", testLeadingAnchor),
        ("testLeadingAnchorGreaterThanOrEqualTo", testLeadingAnchorGreaterThanOrEqualTo),
        ("testLeadingAnchorLessThanOrEqualTo", testLeadingAnchorLessThanOrEqualTo)
    ]
}

