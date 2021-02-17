//
//  Constrainable.swift
//  SketchKit
//
//  Created by Nick Babo on 16/02/21.
//  Copyright (c) 2021 Anykey Entertrainment. All rights reserved.
//

import UIKit

/// Constrainable is an abstraction of Apple layout anchor system
public protocol Constrainable {

    /// A layout anchor abstraction representing the top edge of the view or layout guide frame.
    var topAnchor: NSLayoutYAxisAnchor { get }

    /// A layout anchor abstraction representing the bottom edge of the view or layout guide frame.
    var bottomAnchor: NSLayoutYAxisAnchor { get }

    /// A layout anchor abstraction representing the leading edge of the view or layout guide frame.
    var leadingAnchor: NSLayoutXAxisAnchor { get }

    /// A layout anchor abstraction representing the left edge of the view or layout guide frame.
    var leftAnchor: NSLayoutXAxisAnchor { get }

    /// A layout anchor abstraction representing the trailing edge of the view or layout guide frame.
    var trailingAnchor: NSLayoutXAxisAnchor { get }

    /// A layout anchor abstraction representing the right edge of the view or layout guide frame.
    var rightAnchor: NSLayoutXAxisAnchor { get }

    /// A layout anchor abstraction representing the height of the view or layout guide frame.
    var heightAnchor: NSLayoutDimension { get }

    /// A layout anchor abstraction representing the width of the view or layout guide frame.
    var widthAnchor: NSLayoutDimension { get }

    /// A layout anchor abstraction representing the horizontal center of the view or layout guide frame.
    var centerXAnchor: NSLayoutXAxisAnchor { get }

    /// A layout anchor abstraction representing the vertical center of the view or layout guide frame.
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: Constrainable {

    /// Property to access the SketchKitDSL and be able to applyConstraints
    public var layout: SketchKitDSL {
        return SketchKitDSL(constrainable: self)
    }
}

extension UILayoutGuide: Constrainable {

    /// Property to access the SketchKitDSL and be able to applyConstraints
    public var layout: SketchKitDSL {
        return SketchKitDSL(constrainable: self)
    }
}
