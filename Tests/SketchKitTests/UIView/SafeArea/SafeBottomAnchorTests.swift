//
//  SafeBottomAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 16/10/20.
//

import XCTest
@testable import SketchKit

@available(iOS 11.0, tvOS 11.0, *)
final class SafeBottomAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - BottomAnchor safeArea equalTo

    func testSafeBottomAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.bottomAnchor(equalTo: viewTwo.safeBottomAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    // MARK: - BottomAnchor safeArea greaterThanOrEqualTo

    func testSafeBottomAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.bottomAnchor(greaterThanOrEqualTo: viewTwo.safeBottomAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - BottomAnchor safeArea lessThanOrEqualTo

    func testSafeBottomAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.bottomAnchor(lessThanOrEqualTo: viewTwo.safeBottomAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testSafeBottomAnchor", testSafeBottomAnchor),
        ("testSafeBottomAnchorGreaterThanOrEqualTo", testSafeBottomAnchorGreaterThanOrEqualTo),
        ("testSafeBottomAnchorLessThanOrEqualTo", testSafeBottomAnchorLessThanOrEqualTo)
    ]
}

