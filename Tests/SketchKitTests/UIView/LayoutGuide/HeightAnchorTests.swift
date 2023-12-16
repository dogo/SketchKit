//
//  HeightAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import UIKit
import XCTest

@testable import SketchKit

final class HeightAnchorTests: XCTestCase {

    private var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - HeightAnchor equalToConstant

    func testHeightAnchor() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.heightAnchor(equalToConstant: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.height, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - HeightAnchor greaterThanOrEqualToConstant

    func testHeightAnchorGreaterThanOrEqualToConstant() {

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
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - HeightAnchor lessThanOrEqualToConstant

    func testHeightAnchorLessThanOrEqualToConstant() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.heightAnchor(lessThanOrEqualToConstant: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        if #available(iOS 11.0, tvOS 11.0, *) {
            XCTAssertEqual(view.frame.height, 20, "Should be 20")
        } else {
            XCTAssertEqual(view.frame.height, 0, "Should be 0")
        }
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    // MARK: - HeightAnchor greaterThanOrEqualTo

    func testHeightAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        viewOne.layout.applyConstraint { view in
            view.heightAnchor(greaterThanOrEqualTo: viewTwo.heightAnchor)
            view.heightAnchor(equalToConstant: 10)
        }

        viewOne.layoutIfNeeded()

        let constraints = viewOne.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Constant should be 10")
        XCTAssertEqual(viewOne.frame.height, 20, "Should be 20")
    }

    // MARK: - HeightAnchor lessThanOrEqualTo

    func testHeightAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        viewOne.layout.applyConstraint { view in
            view.heightAnchor(lessThanOrEqualTo: viewTwo.heightAnchor)
            view.heightAnchor(equalToConstant: 30)
        }

        viewOne.layoutIfNeeded()

        let constraints = viewOne.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 30, "Constant should be 30")
        XCTAssertEqual(viewOne.frame.height, 20, "Should be 20")
    }

    static var allTests = [
        ("testHeightAnchor", testHeightAnchor),
        ("testHeightAnchorGreaterThanOrEqualToConstant", testHeightAnchorGreaterThanOrEqualToConstant),
        ("testHeightAnchorLessThanOrEqualToConstant", testHeightAnchorLessThanOrEqualToConstant),
        ("testHeightAnchorGreaterThanOrEqualTo", testHeightAnchorGreaterThanOrEqualTo),
        ("testHeightAnchorLessThanOrEqualTo", testHeightAnchorLessThanOrEqualTo)
    ]
}
