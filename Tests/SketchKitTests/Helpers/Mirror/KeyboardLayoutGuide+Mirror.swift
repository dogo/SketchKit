//
//  KeyboardLayoutGuide+Mirror.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 22/09/24.
//

import Foundation
import UIKit

@testable import SketchKit

extension KeyboardLayoutGuide {

    var bottomConstraint: NSLayoutConstraint? {
        Mirror.extract(variable: "bottomConstraint", from: self)!
    }
}
