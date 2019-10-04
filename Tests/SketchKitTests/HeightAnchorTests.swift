//
//  HeightAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class HeightAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }
    
    //MARK: - HeightAnchor equalTo

    func testHeightAnchor() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.heightAnchor(equalTo: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.height, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }
    
    //MARK: - HeightAnchor safeArea

    func testSafeHeightAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.heightAnchor(equalTo: viewTwo.safeHeightAnchor)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 0, "Should be 0")
        XCTAssertEqual(viewOne.frame.height, 0, "Should be 0")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }
    
    //MARK: - HeightAnchor greaterThanOrEqualTo

    func testHeightAnchorGreaterThanOrEqualTo() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.heightAnchor(greaterThanOrEqualToConstant: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.height, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.greaterThanOrEqual, "Should be greaterThanOrEqual")
    }
    
    //MARK: - HeightAnchor lessThanOrEqualTo

    func testHeightAnchorLessThanOrEqual() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.heightAnchor(lessThanOrEqualToConstant: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.height, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testHeightAnchor", testHeightAnchor),
        ("testSafeHeightAnchor", testSafeHeightAnchor),
        ("testHeightAnchorGreaterThanOrEqualTo", testHeightAnchorGreaterThanOrEqualTo),
        ("testHeightAnchorLessThanOrEqual", testHeightAnchorLessThanOrEqual)
    ]
}
