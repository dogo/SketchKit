//
//  SafeLeadingAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

@available(iOS 11.0, tvOS 11.0, *)
final class SafeLeadingAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - LeadingAnchor safeArea equalTo

    func testSafeLeadingAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.leadingAnchor(equalTo: viewTwo.safeLeadingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.equal, "Should be equal")
    }

    // MARK: - LeadingAnchor safeArea greaterThanOrEqualTo

    func testSafeLeadingAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.leadingAnchor(greaterThanOrEqualTo: viewTwo.safeLeadingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - LeadingAnchor safeArea lessThanOrEqualTo

    func testSafeLeadingAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewOne.layout.applyConstraint { view in
            view.leadingAnchor(lessThanOrEqualTo: viewTwo.safeLeadingAnchor, constant: 10)
        }

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].constant, 10, "Should be 10")
        XCTAssertEqual(constraints[0].relation, NSLayoutConstraint.Relation.lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testSafeLeadingAnchor", testSafeLeadingAnchor),
        ("testSafeLeadingAnchorGreaterThanOrEqualTo", testSafeLeadingAnchorGreaterThanOrEqualTo),
        ("testSafeLeadingAnchorLessThanOrEqualTo", testSafeLeadingAnchorLessThanOrEqualTo)
    ]
}

