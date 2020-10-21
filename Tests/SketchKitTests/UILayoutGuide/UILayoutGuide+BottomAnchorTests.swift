//
//  UILayoutGuide+BottomAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_BottomAnchorTests: XCTestCase {

    var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - BottomAnchor equalTo

    func testBottomAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.bottomAnchor(equalTo: scrollView.bottomAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .bottom, "Should be bottom")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - BottomAnchor greaterThanOrEqualTo

    func testBottomAnchorGreaterThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.bottomAnchor(greaterThanOrEqualTo: scrollView.bottomAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .bottom, "Should be bottom")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - BottomAnchor lessThanOrEqualTo

    func testBottomAnchorLessThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.bottomAnchor(lessThanOrEqualTo: scrollView.bottomAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .bottom, "Should be bottom")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testBottomAnchor", testBottomAnchor),
        ("testBottomAnchorGreaterThanOrEqualTo", testBottomAnchorGreaterThanOrEqualTo),
        ("testBottomAnchorLessThanOrEqualTo", testBottomAnchorLessThanOrEqualTo)
    ]
}
