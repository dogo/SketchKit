//
//  SafeTrailingAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import UIKit
import XCTest

@testable import SketchKit

@available(iOS 11.0, tvOS 11.0, *)
final class SafeTrailingAnchorTests: XCTestCase {

    private var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - TrailingAnchor safeArea equalTo

    func testSafeTrailingAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.trailingAnchor(equalTo: viewTwo.safeTrailingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - TrailingAnchor safeArea greaterThanOrEqual

    func testSafeTrailingAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.trailingAnchor(greaterThanOrEqualTo: viewTwo.safeTrailingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - TrailingAnchor safeArea lessThanOrEqualTo

    func testSafeTrailingAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.trailingAnchor(lessThanOrEqualTo: viewTwo.safeTrailingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testSafeTrailingAnchor", testSafeTrailingAnchor),
        ("testSafeTrailingAnchorGreaterThanOrEqualTo", testSafeTrailingAnchorGreaterThanOrEqualTo),
        ("testSafeTrailingAnchorLessThanOrEqualTo", testSafeTrailingAnchorLessThanOrEqualTo)
    ]
}
