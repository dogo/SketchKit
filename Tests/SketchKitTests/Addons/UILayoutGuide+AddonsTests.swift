//
//  UILayoutGuide+AddonsTests.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 17/10/20.
//

import XCTest
@testable import SketchKit

final class UILayoutGuide_AnchorAddonsTests: XCTestCase {

    var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        self.scrollView = UIScrollView()
    }

    override func tearDown() {
        super.tearDown()
        self.scrollView = nil
    }

    // MARK: - Inset equalTo

    func testInsetWithDefaultParams() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.inset(to: self.scrollView)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 4, "Should have 4 constraints installed")
        XCTAssertEqual(constraints[0].constant, 0, "Should be 0")
        XCTAssertEqual(constraints[1].constant, 0, "Should be 0")
        XCTAssertEqual(constraints[2].constant, 0, "Should be 0")
        XCTAssertEqual(constraints[3].constant, 0, "Should be 0")
        XCTAssertEqual(constraints[0].firstAttribute, .top, "Should be top")
        XCTAssertEqual(constraints[1].firstAttribute, .bottom, "Should be bottom")
        XCTAssertEqual(constraints[2].firstAttribute, .leading, "Should be leading")
        XCTAssertEqual(constraints[3].firstAttribute, .trailing, "Should be trailing")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    func testInset() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.inset(to: self.scrollView, withInset: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 4, "Should have 4 constraints installed")
        XCTAssertEqual(constraints[0].constant, 20, "Should be 20")
        XCTAssertEqual(constraints[1].constant, -20, "Should be 20")
        XCTAssertEqual(constraints[2].constant, 20, "Should be 20")
        XCTAssertEqual(constraints[3].constant, -20, "Should be 20")
        XCTAssertEqual(constraints[0].firstAttribute, .top, "Should be top")
        XCTAssertEqual(constraints[1].firstAttribute, .bottom, "Should be bottom")
        XCTAssertEqual(constraints[2].firstAttribute, .leading, "Should be leading")
        XCTAssertEqual(constraints[3].firstAttribute, .trailing, "Should be trailing")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    // MARK: - AspectRadio equalTo

    func testAspectRadio() {

        let containerLayoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(containerLayoutGuide)

        containerLayoutGuide.layout.applyConstraint { guide in
            guide.aspectRadio(constant: 250 / 2)
        }

        let constraints = self.scrollView.constraints

        XCTAssertEqual(constraints.count, 1, "Should have 1 constraint installed")
        XCTAssertEqual(constraints[0].multiplier, 125, "Should be 125")
        XCTAssertEqual(constraints[0].firstAttribute, .width, "Should be width")
        XCTAssertEqual(constraints[0].secondAttribute, .height, "Should be height")
        XCTAssertEqual(constraints[0].relation, .equal, "Should be equal")
    }

    static var allTests = [
        ("testInsetWithDefaultParams", testInsetWithDefaultParams),
        ("testInset", testInset),
        ("testAspectRadio", testAspectRadio)
    ]
}

