//
//  CustomView.swift
//  Example
//
//  Created by incetro on 6/3/21.
//

import UIKit
import Designable

// MARK: - CustomView

final class CustomView: UIView {

    init() {
        super.init(frame: .zero)
        designer.add(designable: self, for: \.customViewAppearance)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
}

// MARK: - Designable

extension CustomView: Designable {

    func design(appearance: CustomViewAppearance) {
        backgroundColor = appearance.backgroundColor
    }
}
