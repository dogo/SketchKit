//
//  TopAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class TopAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - TopAnchor equalTo

    func testTopAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.topAnchor(equalTo: viewTwo.topAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    // MARK: - TopAnchor equalTo

    func testSafeTopAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.topAnchor(equalTo: viewTwo.safeTopAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    // MARK: - TopAnchor greaterThanOrEqual

    func testTopAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.topAnchor(greaterThanOrEqualTo: viewTwo.topAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - TopAnchor lessThanOrEqualTo

    func testTopAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.topAnchor(lessThanOrEqualTo: viewTwo.topAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testTopAnchor", testTopAnchor),
        ("testSafeTopAnchor", testSafeTopAnchor),
        ("testTopAnchorGreaterThanOrEqualTo", testTopAnchorGreaterThanOrEqualTo),
        ("testTopAnchorLessThanOrEqualTo", testTopAnchorLessThanOrEqualTo)
    ]
}
