//
//  UILayoutGuide+HeightAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import UIKit
import XCTest

@testable import SketchKit

final class UILayoutGuide_HeightAnchorTests: XCTestCase {

    private var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - HeightAnchor equalToConstant

    func testHeightAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.heightAnchor(equalToConstant: 20)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .height, "Should be height")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - HeightAnchor greaterThanOrEqualToConstant

    func testHeightAnchorGreaterThanOrEqualToConstant() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.heightAnchor(greaterThanOrEqualToConstant: 20)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .height, "Should be height")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - HeightAnchor lessThanOrEqualToConstant

    func testHeightAnchorLessThanOrEqualToConstant() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.heightAnchor(lessThanOrEqualToConstant: 20)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .height, "Should be height")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    // MARK: - HeightAnchor equalTo

    func testHeightAnchorEqualTo() {

        let containerLayoutGuide = UILayoutGuide()

        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.heightAnchor(equalTo: scrollView.heightAnchor)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].firstAttribute, .height, "Should be height")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - HeightAnchor greaterThanOrEqualTo

    func testHeightAnchorGreaterThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.heightAnchor(greaterThanOrEqualTo: scrollView.heightAnchor)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].firstAttribute, .height, "Should be height")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - HeightAnchor lessThanOrEqualTo

    func testHeightAnchorLessThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.heightAnchor(lessThanOrEqualTo: scrollView.heightAnchor)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].firstAttribute, .height, "Should be height")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testHeightAnchor", testHeightAnchor),
        ("testHeightAnchorGreaterThanOrEqualToConstant", testHeightAnchorGreaterThanOrEqualToConstant),
        ("testHeightAnchorLessThanOrEqualToConstant", testHeightAnchorLessThanOrEqualToConstant),
        ("testHeightAnchorEqualTo", testHeightAnchorEqualTo),
        ("testHeightAnchorGreaterThanOrEqualTo", testHeightAnchorGreaterThanOrEqualTo),
        ("testHeightAnchorLessThanOrEqualTo", testHeightAnchorLessThanOrEqualTo)
    ]
}
