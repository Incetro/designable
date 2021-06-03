//
//  DesignManipulator.swift
//  Designable IOS
//
//  Created by incetro on 6/2/21.
//

import UIKit

// MARK: - DesignManipulator

/// DesignManipulator which will observe appearance changing event
/// and notify your views about it
public protocol DesignManipulator {

    /// Generic appearance type descriptor
    associatedtype AppearanceType: AnyAppearanceType

    /// Generic appearance descriptor
    associatedtype Appearance

    /// Currently stored theme
    var appearance: Appearance { get }

    /// True if user has enabled system appearance.
    /// Default is true
    var isSystemAppearanceEnabled: Bool { get }

    /// Add a new appearance observer
    /// - Parameters:
    ///   - designable: a new appearance observer
    ///   - keyPath: designable appearance keyPath
    ///   - immediateCall: true if need to design view immediately
    func add<D: Designable>(
        designable: D,
        for keyPath: KeyPath<Appearance, D.Appearance>,
        withImmediateCall immediateCall: Bool
    )

    /// Set a new appearance
    ///
    /// - Parameters:
    ///   - appearance: a new appearance instance
    ///   - animationDuration: changing appearance animation duration
    ///   - isAnimated: true if need to animate appearance changing
    func set(
        appearance: AppearanceType,
        animationDuration: Double,
        isAnimated: Bool
    )
}

extension DesignManipulator {

    /// True if user has enabled system appearance
    public var isSystemAppearanceEnabled: Bool {
        true
    }

    /// Set a new appearance
    ///
    /// - Parameters:
    ///   - appearance: a new appearance instance
    public func set(appearance: AppearanceType) {
        set(appearance: appearance, animationDuration: 0.25, isAnimated: true)
    }

    /// Add a new appearance observer
    /// - Parameters:
    ///   - designable: a new appearance observer
    ///   - keyPath: designable appearance keyPath
    public func add<D: Designable>(
        designable: D,
        for keyPath: KeyPath<Appearance, D.Appearance>
    ) {
        add(designable: designable, for: keyPath, withImmediateCall: true)
    }
}
