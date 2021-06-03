//
//  Designer.swift
//  Designable IOS
//
//  Created by incetro on 6/2/21.
//

import UIKit
import ObserverList

// MARK: - Designer

open class Designer<AppearanceType: AnyAppearanceType, Appearance> {

    // MARK: - Aliases

    /// Auxiliary type for convenient design processing
    private typealias DesignBlock = (DesignableProtocol) -> Void

    /// A basic alias which describes how can we transform our generic appearance type
    /// into a certain appearance structure.
    ///
    /// It may look like this example:
    ///
    ///     private let designer = Designer<AppAppearanceType>(
    ///         appearanceProvider: { type in
    ///             switch type {
    ///             case .light:
    ///                 return Light(
    ///                     accent: .init(
    ///                         hexString: appearanceSettings.accentColor
    ///                     )
    ///                 )
    ///             case .dark:
    ///                 return Dark(
    ///                     accent: .init(
    ///                         hexString: appearanceSettings.accentColor
    ///                     )
    ///                 )
    ///             }
    ///         },
    ///         defaultAppearanceType: .light,
    ///         defaults: .standard
    ///     )
    ///
    public typealias AppearanceProvider = (AppearanceType) -> Appearance

    // MARK: - Properties

    /// An appearance provider which decides how to transform
    /// `AppearanceType` to `AnyAppearance`
    ///
    /// May look like in this example:
    ///
    ///     private let designer = DesignerImplementation<AppAppearanceType>(
    ///         appearanceProvider: { type in
    ///             switch type {
    ///             case .light:
    ///                 return Light(
    ///                     accent: .init(
    ///                         hexString: appearanceSettings.accentColor
    ///                     )
    ///                 )
    ///             case .dark:
    ///                 return Dark(
    ///                     accent: .init(
    ///                         hexString: appearanceSettings.accentColor
    ///                     )
    ///                 )
    ///             }
    ///         },
    ///         defaultAppearanceType: .light,
    ///         defaults: .standard
    ///     )
    ///
    private let appearanceProvider: AppearanceProvider

    /// A default appearance type of our app
    private let defaultAppearanceType: AppearanceType

    /// Current appearance type of our app
    private var appearanceType: AppearanceType {
        if let data = defaults.data(forKey: cacheKey) {
            if let type = try? JSONDecoder().decode(AppearanceType.self, from: data) {
                return type
            }
        }
        return defaultAppearanceType
    }

    /// Current appearance object which was transformed from `appearanceType`
    public private(set) lazy var appearance: Appearance = {
        appearanceProvider(appearanceType)
    }()

    /// An auxiliary UserDefaults key for storing current appearance type
    private let cacheKey = "com.incetro.designable.appearance"

    /// All available observers which wants to be updated after appearance changing
    private let observers = ObserverList<DesignBlock>()

    /// UserDefaults instance
    private let defaults: UserDefaults

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - appearanceProvider: an appearance provider which decides how to transform
    ///                         `AppearanceType` to `AnyAppearance`
    ///   - defaultAppearanceType: a default appearance type of our app
    ///   - defaults: UserDefaults instance
    public init(
        appearanceProvider: @escaping AppearanceProvider,
        defaultAppearanceType: AppearanceType,
        defaults: UserDefaults
    ) {
        self.defaultAppearanceType = defaultAppearanceType
        self.appearanceProvider = appearanceProvider
        self.defaults = defaults
    }
}

// MARK: - DesignManipulator

extension Designer: DesignManipulator {

    /// Add a new appearance observer
    /// - Parameters:
    ///   - designable: a new appearance observer
    ///   - keyPath: designable appearance keyPath
    ///   - immediateCall: true if need to design view immediately
    open func add<D: Designable>(
        designable: D,
        for keyPath: KeyPath<Appearance, D.Appearance>,
        withImmediateCall immediateCall: Bool
    ) {
        let designBlock = { [weak self] (designable: DesignableProtocol) in
            guard let self = self else { return }
            designable.design(appearance: self.appearance[keyPath: keyPath])
        }
        observers.addObserverIfNotContains(disposable: designable) { designable in
            designBlock(designable)
        }
        if immediateCall {
            designBlock(designable)
        }
    }

    /// Set a new appearance
    ///
    /// - Parameters:
    ///   - appearance: a new appearance type
    ///   - animationDuration: changing appearance animation duration
    ///   - isAnimated: true if need to animate appearance changing
    open func set(appearance: AppearanceType, animationDuration: Double, isAnimated: Bool) {
        let newAppearance = appearanceProvider(appearance)
        self.appearance = newAppearance
        let data: Data
        do {
            data = try JSONEncoder().encode(appearance)
        } catch {
            fatalError(error.localizedDescription)
        }
        defaults.removeObject(forKey: cacheKey)
        defaults.set(data, forKey: cacheKey)
        let animationBlock = {
            self.observers.forEach { object, block in
                if let designable = object as? DesignableProtocol {
                    block(designable)
                }
            }
        }
        if isAnimated {
            UIView.animate(withDuration: animationDuration, animations: animationBlock)
        } else {
            animationBlock()
        }
    }
}
