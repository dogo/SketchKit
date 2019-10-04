//
//  SketchKitDSL.swift
//  SketchKit
//
//  Created by Diogo Autilio on 04/10/19.
//  Copyright (c) 2019 Anykey Entertrainment. All rights reserved.
//

import UIKit

public extension UIView {

    var layout: SketchKitDSL {
        return SketchKitDSL(view: self)
    }
}

public class SketchKitDSL {

    let view: UIView

    init(view: UIView) {
        self.view = view
    }

    public func applyConstraint(_ block: ((UIView) -> Void)) {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        block(self.view)
    }
}
