//
//  SketchKitDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2021 Anykey Entertrainment. All rights reserved.
//

#if os(OSX)
import AppKit

/// Abstration for NSView
public typealias View = NSView

/// Abstration for NSLayoutGuide
public typealias LayoutGuide = NSLayoutGuide

/// Abstration for NSLayoutConstraint.Priority
public typealias LayoutPriority = NSLayoutConstraint.Priority

/// Abstration for NSEdgeInsets
public typealias EdgeInsets = NSEdgeInsets

#else
import UIKit

/// Abstration for UIView
public typealias View = UIView

/// Abstration for UILayoutGuide
public typealias LayoutGuide = UILayoutGuide

/// Abstration for UILayoutPriority
public typealias LayoutPriority = UILayoutPriority

/// Abstration for UIEdgeInsets
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
