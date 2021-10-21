//
//  LeadingAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class LeadingAnchorTests: XCTestCase {

    private var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - LeadingAnchor equalTo

    func testLeadingAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: viewTwo.leadingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - LeadingAnchor greaterThanOrEqualTo

    func testLeadingAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.leadingAnchor(greaterThanOrEqualTo: viewTwo.leadingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - LeadingAnchor lessThanOrEqualTo

    func testLeadingAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.leadingAnchor(lessThanOrEqualTo: viewTwo.leadingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testLeadingAnchor", testLeadingAnchor),
        ("testLeadingAnchorGreaterThanOrEqualTo", testLeadingAnchorGreaterThanOrEqualTo),
        ("testLeadingAnchorLessThanOrEqualTo", testLeadingAnchorLessThanOrEqualTo)
    ]
}
