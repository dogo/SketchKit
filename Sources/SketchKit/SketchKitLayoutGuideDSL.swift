//
//  SketchKitLayoutGuideDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 23/04/20.
//

import UIKit

public extension UILayoutGuide {

    /// Property to access the SketchKitLayoutGuideDSL and be able to applyConstraints
    var layout: SketchKitLayoutGuideDSL {
        return SketchKitLayoutGuideDSL(layoutGuide: self)
    }
}

/// SketchKitLayoutGuideDSL
public class SketchKitLayoutGuideDSL {

    let layoutGuide: UILayoutGuide

    init(layoutGuide: UILayoutGuide) {
        self.layoutGuide = layoutGuide
    }

    /// Apply all the constraints to a UILayoutGuide using SketchKitLayoutGuideDSL
    /// - Parameter block: Block with all constraints to be applied to the current layoutGuide.
    public func applyConstraint(_ block: ((UILayoutGuide) -> Void)) {
        block(self.layoutGuide)
    }
}
