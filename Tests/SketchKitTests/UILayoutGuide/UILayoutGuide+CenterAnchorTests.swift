//
//  UILayoutGuide+CenterAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_CenterAnchorTests: XCTestCase {

    var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - CenterXAnchor equalTo

    func testCenterXAnchor() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.centerXAnchor(equalTo: scrollView.centerXAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .centerX, "Should be centerX")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - CenterYAnchor equalTo

    func testCenterYAnchorTests() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.centerYAnchor(equalTo: scrollView.centerYAnchor, constant: 10)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].firstAttribute, .centerY, "Should be centerY")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    static var allTests = [
        ("testCenterXAnchor", testCenterXAnchor),
        ("testCenterXAnchor", testCenterXAnchor),
    ]
}

