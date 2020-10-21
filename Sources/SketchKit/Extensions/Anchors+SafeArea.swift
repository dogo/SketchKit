//
//  Anchors+SafeArea.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import UIKit

public extension UIView {

    /// A layout anchor representing the top edge of the view’s frame considering the SafeArea if available.
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }

    /// A layout anchor representing the bottom edge of the view’s frame considering the SafeArea if available.
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }

    /// A layout anchor representing the leading edge of the view’s frame considering the SafeArea if available.
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }

    /// A layout anchor representing the left edge of the view’s frame considering the SafeArea if available.
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }

    /// A layout anchor representing the trailing edge of the view’s frame considering the SafeArea if available.
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }

    /// A layout anchor representing the right edge of the view’s frame considering the SafeArea if available.
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }

    /// A layout anchor representing the horizontal center of the view’s frame considering the SafeArea if available.
    var safeCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.centerXAnchor
        }
        return centerXAnchor
    }

    /// A layout anchor representing the vertical center of the view’s frame considering the SafeArea if available.
    var safeCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.centerYAnchor
        }
        return centerYAnchor
    }

    /// A layout anchor representing the width of the view’s frame considering the SafeArea if available.
    var safeWidthAnchor: NSLayoutDimension {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.widthAnchor
        }
        return widthAnchor
    }

    /// A layout anchor representing the height of the view’s frame considering the SafeArea if available.
    var safeHeightAnchor: NSLayoutDimension {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return safeAreaLayoutGuide.heightAnchor
        }
        return heightAnchor
    }
}
