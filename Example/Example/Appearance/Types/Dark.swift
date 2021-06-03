//
//  Dark.swift
//  Example
//
//  Created by incetro on 6/3/21.
//

import UIKit
import Designable

// MARK: - Dark

struct Dark {

    // MARK: - Properties

    let backgroundColor: UIColor
}

// MARK: - Appearance

extension Dark: Appearance {

    var type: AnyAppearanceType {
        AppAppearanceType.dark
    }

    var viewControllerAppearance: ViewControllerAppearance {
        ViewControllerAppearance(backgroundColor: backgroundColor)
    }

    var customViewAppearance: CustomViewAppearance {
        CustomViewAppearance(backgroundColor: .init(rgb: 0xFFC947))
    }
}
