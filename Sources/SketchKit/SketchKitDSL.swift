//
//  SketchKitDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2021 Anykey Entertainment. All rights reserved.
//

#if os(OSX)
import AppKit

/// Cross-platform abstraction over `UIView` (iOS/tvOS) and `NSView` (macOS).
public typealias View = NSView

/// Cross-platform abstraction over `UILayoutGuide` (iOS/tvOS) and `NSLayoutGuide` (macOS).
public typealias LayoutGuide = NSLayoutGuide

/// Cross-platform abstraction over `UILayoutPriority` (iOS/tvOS) and `NSLayoutConstraint.Priority` (macOS).
public typealias LayoutPriority = NSLayoutConstraint.Priority

/// Cross-platform abstraction over `UIEdgeInsets` (iOS/tvOS) and `NSEdgeInsets` (macOS).
public typealias EdgeInsets = NSEdgeInsets

#else
import UIKit

/// Cross-platform abstraction over `UIView` (iOS/tvOS) and `NSView` (macOS).
public typealias View = UIView

/// Cross-platform abstraction over `UILayoutGuide` (iOS/tvOS) and `NSLayoutGuide` (macOS).
public typealias LayoutGuide = UILayoutGuide

/// Cross-platform abstraction over `UILayoutPriority` (iOS/tvOS) and `NSLayoutConstraint.Priority` (macOS).
public typealias LayoutPriority = UILayoutPriority

/// Cross-platform abstraction over `UIEdgeInsets` (iOS/tvOS) and `NSEdgeInsets` (macOS).
public typealias EdgeInsets = UIEdgeInsets

#endif

/// SketchKitDSL
public class SketchKitDSL {

    private let constrainable: Constrainable

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

#if os(iOS)
    func resolveKeyboardLayoutGuide() -> LayoutGuide {
        guard let view = constrainable as? View else { return LayoutGuide() }

        let layoutGuideIdentifier = "KeyboardLayoutGuide"

        // Attempt to find an existing keyboard layout guide by its identifier
        if let existingLayoutGuide = view.layoutGuides.first(where: { $0.identifier == layoutGuideIdentifier }) {
            return existingLayoutGuide
        }

        // Create and configure a new keyboard layout guide if it doesn't exist
        let keyboardLayoutGuide = KeyboardLayoutGuide()
        keyboardLayoutGuide.identifier = layoutGuideIdentifier
        view.addLayoutGuide(keyboardLayoutGuide)
        keyboardLayoutGuide.setUp()

        return keyboardLayoutGuide
    }
#endif
}
