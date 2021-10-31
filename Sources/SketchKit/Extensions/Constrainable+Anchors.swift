//
//  Constrainable+Anchors.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2021 Anykey Entertrainment. All rights reserved.
//

#if os(OSX)
import AppKit
#else
import UIKit
#endif

public extension Constrainable {

    /// A layout anchor representing the top edge of the view’s frame.
    ///
    /// - Parameter equalTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func topAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                   constant: CGFloat = 0,
                   priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the top edge of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func topAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                   constant: CGFloat = 0,
                   priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the top edge of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func topAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                   constant: CGFloat = 0,
                   priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the bottom edge of the view’s frame.
    ///
    /// - Parameter equalTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                      constant: CGFloat = 0,
                      priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the bottom edge of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func bottomAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                      constant: CGFloat = 0,
                      priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the bottom edge of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func bottomAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor,
                      constant: CGFloat = 0,
                      priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the leading edge of the view’s frame.
    ///
    /// - Parameter equalTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func leadingAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                       constant: CGFloat = 0,
                       priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the leading edge of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func leadingAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                       constant: CGFloat = 0,
                       priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the leading edge of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func leadingAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                       constant: CGFloat = 0,
                       priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the left edge of the view’s frame.
    ///
    /// - Parameter equalTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func leftAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                    constant: CGFloat = 0,
                    priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the left edge of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func leftAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                    constant: CGFloat = 0,
                    priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the left edge of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func leftAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                    constant: CGFloat = 0,
                    priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the trailing edge of the view’s frame.
    ///
    /// - Parameter equalTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func trailingAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                        constant: CGFloat = 0,
                        priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the trailing edge of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func trailingAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                        constant: CGFloat = 0,
                        priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the trailing edge of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func trailingAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                        constant: CGFloat = 0,
                        priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the right edge of the view’s frame.
    ///
    /// - Parameter equalTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func rightAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                     constant: CGFloat = 0,
                     priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the right edge of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func rightAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                     constant: CGFloat = 0,
                     priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the right edge of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: Vertical layout constraint.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func rightAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor,
                     constant: CGFloat = 0,
                     priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the height of the view’s frame.
    ///
    /// - Parameter equalToConstant: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func heightAnchor(equalToConstant height: CGFloat,
                      priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the height of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualToConstant: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func heightAnchor(greaterThanOrEqualToConstant height: CGFloat,
                      priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the height of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualToConstant: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func heightAnchor(lessThanOrEqualToConstant height: CGFloat,
                      priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the height of the view’s frame.
    ///
    /// - Parameter equalTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Parameter multiplier: The multiplier constant for the constraint.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func heightAnchor(equalTo layoutDimension: NSLayoutDimension,
                      priority: LayoutPriority = .required,
                      multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the height of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Parameter multiplier: The multiplier constant for the constraint.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func heightAnchor(lessThanOrEqualTo layoutDimension: NSLayoutDimension,
                      priority: LayoutPriority = .required,
                      multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(lessThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the height of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Parameter multiplier: The multiplier constant for the constraint.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func heightAnchor(greaterThanOrEqualTo layoutDimension: NSLayoutDimension,
                      priority: LayoutPriority = .required,
                      multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(greaterThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the width of the view’s frame.
    ///
    /// - Parameter equalToConstant: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func widthAnchor(equalToConstant width: CGFloat,
                     priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the width of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualToConstant: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func widthAnchor(greaterThanOrEqualToConstant width: CGFloat,
                     priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the width of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualToConstant: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func widthAnchor(lessThanOrEqualToConstant width: CGFloat,
                     priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the width of the view’s frame.
    ///
    /// - Parameter equalTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Parameter multiplier: The multiplier constant for the constraint.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func widthAnchor(equalTo layoutDimension: NSLayoutDimension,
                     priority: LayoutPriority = .required,
                     multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the width of the view’s frame.
    ///
    /// - Parameter lessThanOrEqualTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Parameter multiplier: The multiplier constant for the constraint.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func widthAnchor(lessThanOrEqualTo layoutDimension: NSLayoutDimension,
                     priority: LayoutPriority = .required,
                     multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(lessThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the width of the view’s frame.
    ///
    /// - Parameter greaterThanOrEqualTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Parameter multiplier: The multiplier constant for the constraint.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func widthAnchor(greaterThanOrEqualTo layoutDimension: NSLayoutDimension,
                     priority: LayoutPriority = .required,
                     multiplier: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(greaterThanOrEqualTo: layoutDimension, multiplier: multiplier)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the horizontal center of the view’s frame.
    ///
    /// - Parameter equalTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func centerXAnchor(equalTo anchor: NSLayoutXAxisAnchor,
                       constant: CGFloat = 0,
                       priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    /// A layout anchor representing the vertical center of the view’s frame.
    ///
    /// - Parameter equalTo: A constant representing the size of the attribute associated with this dimension anchor.
    /// - Parameter constant: The constant offset for the constraint.
    /// - Parameter priority: Layout priority used to indicate the constraint-based layout system.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func centerYAnchor(equalTo anchor: NSLayoutYAxisAnchor,
                       constant: CGFloat = 0,
                       priority: LayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}

public extension Constrainable {

    /// A layout anchor to set inset distances for views.
    ///
    /// - Parameter to: The target View to apply the edge insets.
    /// - Parameter withInset: Adjusts a rectangle by the given edge insets.
    /// - Returns: All the activated and applied constraints to the current View with
    @discardableResult
    func inset(to view: View, withInset inset: EdgeInsets? = nil) -> [NSLayoutConstraint] {
        return [
            topAnchor(equalTo: view.topAnchor, constant: inset?.top ?? 0),
            bottomAnchor(equalTo: view.bottomAnchor, constant: -(inset?.bottom ?? 0)),
            leadingAnchor(equalTo: view.leadingAnchor, constant: inset?.left ?? 0),
            trailingAnchor(equalTo: view.trailingAnchor, constant: -(inset?.right ?? 0))
        ]
    }

    /// A layout anchor representing the aspect ratio of a View.
    ///
    /// - Parameter constant: A constant representing the value of the aspect ratio to be applied.
    /// - Returns: An activated NSLayoutConstraint object that defines a constant size for the attribute associated with this dimension anchor.
    @discardableResult
    func aspectRatio(constant: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: constant)
        constraint.priority = .required
        constraint.isActive = true
        return constraint
    }
}
