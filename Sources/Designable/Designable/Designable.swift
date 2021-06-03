//
//  Designable.swift
//  Designable IOS
//
//  Created by incetro on 6/1/21.
//

import UIKit

// MARK: - Designable

public protocol Designable: DesignableProtocol {

    /// You view appearance type
    associatedtype Appearance

    /// Colorize element with some Appearance
    ///
    /// - Parameter appearance: some Appearance instance
    func design(appearance: Appearance)
}

extension Designable {

    public func design(appearance: Any) {
        if let appearance = appearance as? Appearance {
            design(appearance: appearance)
        }
    }
}
