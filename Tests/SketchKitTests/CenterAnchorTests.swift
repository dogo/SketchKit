//
//  CenterAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import XCTest
@testable import SketchKit

final class CenterAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container.removeConstraints(self.container.constraints)
        self.container = nil
    }
    
    //MARK: - CenterXAnchor equalTo

    func testCenterXAnchor() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.centerXAnchor(equalTo: self.container.centerXAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }
    
    //MARK: - CenterXAnchor safeArea

    func testSafeCenterXAnchor() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.centerXAnchor(equalTo: self.container.safeCenterXAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 5, "Should have 5 constraints installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }
    
    //MARK: - CenterYAnchor equalTo

    func testCenterYAnchorTests() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: self.container.centerYAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }
    
    //MARK: - CenterYAnchor safeArea

    func testSafeCenterYAnchorTests() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: self.container.safeCenterYAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 5, "Should have 5 constraints installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    static var allTests = [
        ("testCenterXAnchor", testCenterXAnchor), ("testSafeCenterXAnchor", testSafeCenterXAnchor),
        ("testCenterXAnchor", testCenterXAnchor), ("testSafeCenterYAnchorTests", testSafeCenterYAnchorTests)
    ]
}
