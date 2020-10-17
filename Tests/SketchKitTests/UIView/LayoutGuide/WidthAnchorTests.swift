//
//  WidthAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class WidthAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - WidthAnchor equalTo

    func testWidthAnchor() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.widthAnchor(equalToConstant: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.width, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - WidthAnchor greaterThanOrEqualToConstant

    func testWidthAnchorGreaterThanOrEqualToConstant() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.widthAnchor(greaterThanOrEqualToConstant: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.width, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - WidthAnchor lessThanOrEqualToConstant

    func testWidthAnchorLessThanOrEqualToConstant() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.widthAnchor(lessThanOrEqualToConstant: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.width, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    // MARK: - WidthAnchor greaterThanOrEqualTo

    func testWidthAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        viewOne.layout.applyConstraint { view in
            view.widthAnchor(greaterThanOrEqualTo: viewTwo.widthAnchor)
            view.widthAnchor(equalToConstant: 10)
        }

        viewOne.layoutIfNeeded()

        let constraints = viewOne.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Constant should be 10")
        XCTAssertEqual(viewOne.frame.width, 20, "Should be 20")
    }

    // MARK: - WidthAnchor lessThanOrEqualTo

    func testWidthAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        viewOne.layout.applyConstraint { view in
            view.widthAnchor(lessThanOrEqualTo: viewTwo.widthAnchor)
            view.widthAnchor(equalToConstant: 30)
        }

        viewOne.layoutIfNeeded()

        let constraints = viewOne.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 30, "Constant should be 30")
        XCTAssertEqual(viewOne.frame.width, 20, "Should be 20")
    }

    static var allTests = [
        ("testWidthAnchor", testWidthAnchor),
        ("testWidthAnchorGreaterThanOrEqualToConstant", testWidthAnchorGreaterThanOrEqualToConstant),
        ("testWidthAnchorLessThanOrEqualToConstant", testWidthAnchorLessThanOrEqualToConstant),
        ("testWidthAnchorGreaterThanOrEqualTo", testWidthAnchorGreaterThanOrEqualTo),
        ("testWidthAnchorLessThanOrEqualTo", testWidthAnchorLessThanOrEqualTo)
    ]
}
