//
//  SketchKitLayoutGuideDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 23/04/20.
//

import UIKit

public extension UILayoutGuide {

    var layout: SketchKitLayoutGuideDSL {
        return SketchKitLayoutGuideDSL(layoutGuide: self)
    }
}

public class SketchKitLayoutGuideDSL {

    let layoutGuide: UILayoutGuide

    init(layoutGuide: UILayoutGuide) {
        self.layoutGuide = layoutGuide
    }

    public func applyConstraint(_ block: ((UILayoutGuide) -> Void)) {
        block(self.layoutGuide)
    }
}
