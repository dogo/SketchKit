//
//  SketchKitDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import UIKit

/// SketchKitDSL
public class SketchKitDSL {

    let constrainable: Constrainable

    init(constrainable: Constrainable) {
        self.constrainable = constrainable
    }

    /// Apply all the constraints to a UIView or UILayoutGuide using SketchKitDSL
    /// - Parameter block: Block with all constraints to be applied to the current layoutGuide.
    public func applyConstraint(_ block: ((Constrainable) -> Void)) {
        if constrainable is UIView {
            (constrainable as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
        block(self.constrainable)
    }
}
