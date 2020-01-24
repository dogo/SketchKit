//
//  RightAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 24/01/20.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class RightAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - RightAnchor equalTo

    func testRightAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.rightAnchor(equalTo: viewTwo.rightAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    // MARK: - RightAnchor safeArea

    func testSafeRightAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.rightAnchor(equalTo: viewTwo.safeRightAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    // MARK: - RightAnchor greaterThanOrEqual

    func testRightAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.rightAnchor(greaterThanOrEqualTo: viewTwo.rightAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - RightAnchor lessThanOrEqualTo

    func testRightAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.rightAnchor(lessThanOrEqualTo: viewTwo.rightAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testRightAnchor", testRightAnchor),
        ("testSafeRightAnchor", testSafeRightAnchor),
        ("testRightAnchorGreaterThanOrEqualTo", testRightAnchorGreaterThanOrEqualTo),
        ("testRightAnchorLessThanOrEqualTo", testRightAnchorLessThanOrEqualTo)
    ]
}
