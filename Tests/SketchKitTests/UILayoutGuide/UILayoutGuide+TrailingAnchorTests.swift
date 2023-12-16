//
//  UILayoutGuide+TrailingAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import UIKit
import XCTest

@testable import SketchKit

final class UILayoutGuide_TrailingAnchorTests: XCTestCase {

    private var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - TrailingAnchor equalTo

    func testTrailingAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.trailingAnchor(equalTo: scrollView.trailingAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .trailing, "Should be trailing")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - TrailingAnchor greaterThanOrEqual

    func testTrailingAnchorGreaterThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.trailingAnchor(greaterThanOrEqualTo: scrollView.trailingAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .trailing, "Should be trailing")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - TrailingAnchor lessThanOrEqualTo

    func testTrailingAnchorLessThanOrEqualTo() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.trailingAnchor(lessThanOrEqualTo: scrollView.trailingAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .trailing, "Should be trailing")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testTrailingAnchor", testTrailingAnchor),
        ("testTrailingAnchorGreaterThanOrEqualTo", testTrailingAnchorGreaterThanOrEqualTo),
        ("testTrailingAnchorLessThanOrEqualTo", testTrailingAnchorLessThanOrEqualTo)
    ]
}
