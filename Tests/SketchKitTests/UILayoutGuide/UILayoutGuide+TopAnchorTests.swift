//
//  UILayoutGuide+TopAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_TopAnchorTests: XCTestCase {

    var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - TopAnchor equalTo

    func testTopAnchor() {
        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.topAnchor(equalTo: scrollView.topAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .top, "Should be top")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - TopAnchor greaterThanOrEqual

    func testTopAnchorGreaterThanOrEqualTo() {
        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.topAnchor(greaterThanOrEqualTo: self.scrollView.topAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .top, "Should be top")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - TopAnchor lessThanOrEqualTo

    func testTopAnchorLessThanOrEqualTo() {
        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.topAnchor(lessThanOrEqualTo: self.scrollView.topAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .top, "Should be top")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testTopAnchor", testTopAnchor),
        ("testTopAnchorGreaterThanOrEqualTo", testTopAnchorGreaterThanOrEqualTo),
        ("testTopAnchorLessThanOrEqualTo", testTopAnchorLessThanOrEqualTo)
    ]
}

