//
//  SafeCenterAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 15/10/20.
//

import XCTest
@testable import SketchKit

@available(iOS 11.0, tvOS 11.0, *)
final class SafeCenterAnchorTests: XCTestCase {

    private var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container.removeConstraints(self.container.constraints)
        self.container = nil
    }

    // MARK: - CenterXAnchor safeArea

    func testSafeCenterXAnchor() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.centerXAnchor(equalTo: self.container.safeCenterXAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        if #available(iOS 11.0, tvOS 11.0, macOS 11.0, *) {
            XCTAssertEqual(constraints.count, 5, "Should have 5 constraints installed")
        } else {
            XCTAssertEqual(constraints.count, 1, "Should have 1 constraints installed")
        }
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - CenterYAnchor safeArea

    func testSafeCenterYAnchorTests() {

        let view = UIView()
        self.container.addSubview(view)

        view.layout.applyConstraint { view in
            view.centerYAnchor(equalTo: self.container.safeCenterYAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        if #available(iOS 11.0, tvOS 11.0, macOS 11.0, *) {
            XCTAssertEqual(constraints.count, 5, "Should have 5 constraints installed")
        } else {
            XCTAssertEqual(constraints.count, 1, "Should have 1 constraints installed")
        }
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    static var allTests = [
        ("testSafeCenterXAnchor", testSafeCenterXAnchor),
        ("testSafeCenterYAnchorTests", testSafeCenterYAnchorTests)
    ]
}
