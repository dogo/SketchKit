//
//  BottomAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class BottomAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - BottomAnchor equalTo

    func testBottomAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.bottomAnchor(equalTo: viewTwo.bottomAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    // MARK: - BottomAnchor greaterThanOrEqualTo

    func testBottomAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.bottomAnchor(greaterThanOrEqualTo: viewTwo.bottomAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - BottomAnchor lessThanOrEqualTo

    func testBottomAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.bottomAnchor(lessThanOrEqualTo: viewTwo.bottomAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testBottomAnchor", testBottomAnchor),
        ("testBottomAnchorGreaterThanOrEqualTo", testBottomAnchorGreaterThanOrEqualTo),
        ("testBottomAnchorLessThanOrEqualTo", testBottomAnchorLessThanOrEqualTo)
    ]
}
