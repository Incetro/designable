//
//  DesignableProtocol.swift
//  Designable IOS
//
//  Created by incetro on 6/2/21.
//

import Foundation

// MARK: - DesignableProtocol

public protocol DesignableProtocol: AnyObject {

    /// Colorize element with some Appearance
    ///
    /// - Parameter appearance: some Appearance instance
    func design(appearance: Any)
}
