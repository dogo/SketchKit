//
//  Mirror+Testable.swift
//  SketchKitTests
//
//  Created by Diogo Autilio on 29/11/23.
//

import Foundation

extension Mirror {

    static func extract<T>(variable name: String, from instance: Any?) -> T? {
        guard let instance else { return nil }

        let mirror = Mirror(reflecting: instance)

        return mirror.children.first { $0.label == name }?.value as? T
    }
}
