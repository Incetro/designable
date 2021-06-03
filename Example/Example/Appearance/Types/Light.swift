//
//  Light.swift
//  Example
//
//  Created by incetro on 6/3/21.
//

import Designable

// MARK: - Light

struct Light {
}

// MARK: - Appearance

extension Light: Appearance {

    var type: AnyAppearanceType {
        AppAppearanceType.light
    }

    var viewControllerAppearance: ViewControllerAppearance {
        ViewControllerAppearance(backgroundColor: .init(rgb: 0xF8F5F1))
    }

    var customViewAppearance: CustomViewAppearance {
        CustomViewAppearance(backgroundColor: .init(rgb: 0x387C6D))
    }
}
