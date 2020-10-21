//
//  SketchKitViewDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import UIKit

public extension UIView {

    /// Property to access the SketchKitViewDSL and be able to applyConstraints
    var layout: SketchKitViewDSL {
        return SketchKitViewDSL(view: self)
    }
}

/// SketchKitViewDSL
public class SketchKitViewDSL {

    let view: UIView

    init(view: UIView) {
        self.view = view
    }

    /// Apply all the constraints to a UIView using SketchKitLayoutGuideDSL
    /// - Parameter block: Block with all constraints to be applied to the current layoutGuide.
    public func applyConstraint(_ block: ((UIView) -> Void)) {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        block(self.view)
    }
}
