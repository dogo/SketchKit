//
//  SafeTopAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

@available(iOS 11.0, tvOS 11.0, *)
final class SafeTopAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - TopAnchor safeArea equalTo

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
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - TopAnchor safeArea greaterThanOrEqual

    func testSafeTopAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.topAnchor(greaterThanOrEqualTo: viewTwo.safeTopAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - TopAnchor safeArea lessThanOrEqualTo

    func testSafeTopAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.topAnchor(lessThanOrEqualTo: viewTwo.safeTopAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testSafeTopAnchor", testSafeTopAnchor),
        ("testSafeTopAnchorGreaterThanOrEqualTo", testSafeTopAnchorGreaterThanOrEqualTo),
        ("testSafeTopAnchorLessThanOrEqualTo", testSafeTopAnchorLessThanOrEqualTo)
    ]
}

