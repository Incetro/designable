//
//  AnyAppearanceType.swift
//  Designable IOS
//
//  Created by incetro on 6/2/21.
//

import UIKit

// MARK: - AnyAppearanceType

/// Basic protocol for appearance type
///
/// Generally, it will be a enum like this:
///
///     // MARK: - AppearanceType
///
///     enum AppearanceType: Int, AnyAppearanceType {
///
///         case dark
///         case light
///         case graphite
///
///         var name: String? {
///             switch self {
///             case .dark:
///                 return L10n.Themes.Types.dark
///             case .light:
///                 return L10n.Themes.Types.light
///             case .graphite:
///                 return L10n.Themes.Types.graphite
///             }
///         }
///
///         var image: UIImage? {
///             switch self {
///             case .dark:
///                 return Asset.Settings.Appearance.darkAppearance.image
///             case .light:
///                 return Asset.Settings.Appearance.lightAppearance.image
///             case .graphite:
///                 return Asset.Settings.Appearance.graphiteAppearance.image
///             }
///         }
///     }
///
public protocol AnyAppearanceType: Codable {

    /// Your custom appearance name.
    /// This property added for cases when you have
    /// some UI component that should visualize all of your appearance types
    /// Default is nil
    var name: String? { get }

    /// Your custom appearance image.
    /// This property added for cases when you have
    /// some UI component that should visualize all of your appearance types
    /// Default is nil
    var image: UIImage? { get }
}

// MARK: - Default

public extension AnyAppearanceType {

    /// Your custom appearance name.
    /// This property added for cases when you have
    /// some UI component that should visualize all of your appearance types
    var name: String? { nil }

    /// Your custom appearance image.
    /// This property added for cases when you have
    /// some UI component that should visualize all of your appearance types
    /// Default is nil
    var image: UIImage? { nil }
}
