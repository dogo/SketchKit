//
//  SketchKitDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2021 Anykey Entertrainment. All rights reserved.
//

#if os(OSX)
import AppKit

public typealias View = NSView
public typealias LayoutGuide = NSLayoutGuide
public typealias LayoutPriority = NSLayoutConstraint.Priority
public typealias EdgeInsets = NSEdgeInsets

#else
import UIKit

public typealias View = UIView
public typealias LayoutGuide = UILayoutGuide
public typealias LayoutPriority = UILayoutPriority
public typealias EdgeInsets = UIEdgeInsets

#endif

/// SketchKitDSL
public class SketchKitDSL {

    let constrainable: Constrainable

    init(constrainable: Constrainable) {
        self.constrainable = constrainable
    }

    /// Apply all the constraints to a UIView or UILayoutGuide using SketchKitDSL
    /// - Parameter block: Block with all constraints to be applied to the current layoutGuide.
    public func applyConstraint(_ block: ((Constrainable) -> Void)) {
        if constrainable is View {
            (constrainable as? View)?.translatesAutoresizingMaskIntoConstraints = false
        }
        block(self.constrainable)
    }
}
