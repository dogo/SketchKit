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
    
    //MARK: - WidthAnchor equalTo

    func testWidthAnchor() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.widthAnchor(equalTo: 20)
        }
        view.layoutIfNeeded()

        let constraints = view.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(view.frame.width, 20, "Should be 20")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }
    
    //MARK: - WidthAnchor equalTo

    func testSafeWidthAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.widthAnchor(equalTo: viewTwo.safeWidthAnchor)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 0, "Should be 0")
        XCTAssertEqual(viewOne.frame.height, 0, "Should be 0")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }
    
    //MARK: - WidthAnchor greaterThanOrEqual
    
    func testWidthAnchorGreaterThanOrEqual() {

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
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.greaterThanOrEqual, "Should be greaterThanOrEqual")
    }
    
    //MARK: - WidthAnchor greaterThanOrEqual
    
    func testWidthAnchorLessThanOrEqualTo() {

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
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testWidthAnchor", testWidthAnchor),
        ("testSafeWidthAnchor", testSafeWidthAnchor),
        ("testWidthAnchorGreaterThanOrEqual", testWidthAnchorGreaterThanOrEqual),
        ("testWidthAnchorLessThanOrEqualTo", testWidthAnchorLessThanOrEqualTo)
    ]
}
