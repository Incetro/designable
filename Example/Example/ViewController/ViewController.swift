//
//  ViewController.swift
//  Example
//
//  Created by incetro on 6/2/21.
//

import UIKit
import Designable

let designer = Designer<AppAppearanceType, Appearance>(
    appearanceProvider: { type in
        switch type {
        case .light:
            return Light()
        case .dark:
            return Dark(backgroundColor: .init(rgb: 0x252525))
        case .graphite:
            return Dark(backgroundColor: .init(rgb: 0x393E46))
        }
    },
    defaultAppearanceType: .light,
    defaults: .standard
)

// MARK: - ViewController

final class ViewController: UIViewController {

    // MARK: - Properties

    private let customView = CustomView()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)
        customView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        customView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        customView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(customViewTapAction)))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let roundPath = UIBezierPath(
            roundedRect: customView.bounds,
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(width: 31, height: 31)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        customView.layer.mask = maskLayer
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle == .dark {
            designer.set(appearance: .dark)
        } else {
            designer.set(appearance: .light)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        designer.add(designable: self, for: \.viewControllerAppearance)
    }

    // MARK: - Actions

    @objc private func customViewTapAction() {
        designer.set(appearance: .graphite)
    }
}

// MARK: - Designable

extension ViewController: Designable {

    /// In the Simulator press [Cmd Shift A] and you will see an appearance changing
    func design(appearance: ViewControllerAppearance) {
        view.backgroundColor = appearance.backgroundColor
    }
}
