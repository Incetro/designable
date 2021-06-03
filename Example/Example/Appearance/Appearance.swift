//
//  Appearance.swift
//  Example
//
//  Created by incetro on 6/3/21.
//

import Designable

// MARK: - Appearance

protocol Appearance: AnyAppearance {

    /// ViewControllerAppearance instance
    var viewControllerAppearance: ViewControllerAppearance { get }

    /// CustomViewAppearance instance
    var customViewAppearance: CustomViewAppearance { get }
}
