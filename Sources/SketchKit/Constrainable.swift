//
//  Constrainable.swift
//  SketchKit
//
//  Created by Nick Babo on 16/02/21.
//

import UIKit

public protocol Constrainable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }

    var trailingAnchor: NSLayoutXAxisAnchor { get }

    var leftAnchor: NSLayoutXAxisAnchor { get }

    var rightAnchor: NSLayoutXAxisAnchor { get }

    var topAnchor: NSLayoutYAxisAnchor { get }

    var bottomAnchor: NSLayoutYAxisAnchor { get }

    var widthAnchor: NSLayoutDimension { get }

    var heightAnchor: NSLayoutDimension { get }

    var centerXAnchor: NSLayoutXAxisAnchor { get }

    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: Constrainable {
    
    /// Property to access the SketchKitViewDSL and be able to applyConstraints
    public var layout: SketchKitViewDSL {
        return SketchKitViewDSL(constrainable: self)
    }
}

extension UILayoutGuide: Constrainable {
    
    /// Property to access the SketchKitViewDSL and be able to applyConstraints
    public var layout: SketchKitViewDSL {
        return SketchKitViewDSL(constrainable: self)
    }
}
