//
//  SafeHeightAnchorTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

@available(iOS 11.0, tvOS 11.0, *)
final class SafeHeightAnchorTests: XCTestCase {

    var container: UIView!

    override func setUp() {
        super.setUp()
        self.container = UIView()
    }

    override func tearDown() {
        super.tearDown()
        self.container = nil
    }

    // MARK: - HeightAnchor safeArea equalTo

    func testSafeHeightAnchor() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        viewOne.layout.applyConstraint { view in
            view.heightAnchor(equalTo: viewTwo.safeHeightAnchor)
        }

        viewOne.layoutIfNeeded()

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 5, "Should have 5 constraints installed")
        XCTAssertEqual(constraints.first { $0.firstAttribute == .width }?.constant, 20, "Should be 20")
        XCTAssertEqual(viewOne.frame.height, 20, "Should be 20")
        XCTAssertEqual(constraints.first { $0.firstAttribute == .height && $0.relation == .equal }?.relation, .equal, "Should be equal")
    }

    // MARK: - HeightAnchor safeArea greaterThanOrEqualTo

    func testSafeHeightAnchorGreaterThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        viewOne.layout.applyConstraint { view in
            view.heightAnchor(greaterThanOrEqualTo: viewTwo.safeHeightAnchor)
        }

        viewOne.layoutIfNeeded()

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 5, "Should have 5 constraints installed")
        XCTAssertEqual(constraints.first { $0.firstAttribute == .width }?.constant, 20, "Should be 20")
        XCTAssertEqual(viewOne.frame.height, 20, "Should be 20")
        XCTAssertEqual(constraints.first { $0.firstAttribute == .height && $0.relation == .greaterThanOrEqual }?.relation, .greaterThanOrEqual, "Should be greaterThanOrEqual")
    }

    // MARK: - HeightAnchor safeArea lessThanOrEqualTo

    func testSafeHeightAnchorLessThanOrEqualTo() {

        let viewOne = UIView()
        let viewTwo = UIView()
        self.container.addSubview(viewOne)
        self.container.addSubview(viewTwo)

        viewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        viewOne.layout.applyConstraint { view in
            view.heightAnchor(lessThanOrEqualTo: viewTwo.safeHeightAnchor)
        }

        viewOne.layoutIfNeeded()

        let constraints = self.container.constraints

        XCTAssertEqual(constraints.count, 5, "Should have 5 constraints installed")
        XCTAssertEqual(constraints.first { $0.firstAttribute == .width }?.constant, 20, "Should be 20")
        if #available(iOS 11.0, tvOS 11.0, macOS 11.0, *) {
            XCTAssertEqual(viewOne.frame.height, 20, "Should be 20")
        } else {
            XCTAssertEqual(viewOne.frame.height, 0, "Should be 0")
        }
        XCTAssertEqual(constraints.first { $0.firstAttribute == .height && $0.relation == .lessThanOrEqual }?.relation, .lessThanOrEqual, "Should be lessThanOrEqual")
    }

    static var allTests = [
        ("testSafeHeightAnchor", testSafeHeightAnchor),
        ("testSafeHeightAnchorGreaterThanOrEqualTo", testSafeHeightAnchorGreaterThanOrEqualTo),
        ("testSafeHeightAnchorLessThanOrEqualTo", testSafeHeightAnchorLessThanOrEqualTo)
    ]
}
