//
//  Appearance.swift
//  Designable IOS
//
//  Created by incetro on 6/2/21.
//

import Foundation

// MARK: - Appearance

/// Basic global appearance representation
///
/// There should be stored all of your app appearance types.
/// The easiest way to understand this is to look at example.
///
/// Imagine that you have some screen with view controller and table view cells.
/// You will have an appearance for each of them:
///
///     // MARK: - EnvironmentCellAppearance
///
///     /// Simple appearance for EnvironmentCell
///     struct EnvironmentCellAppearance {
///
///         // MARK: - Properties
///
///         let backgroundColor: UIColor
///         let environmentLabelFont: UIFont
///         let environmentLabelColor: UIColor
///         let tintColor: UIColor
///     }
///
///     // MARK: - EnvironmentViewControllerAppearance
///
///     /// Simple appearance for EnvironmentViewController
///     struct EnvironmentViewControllerAppearance {
///
///         // MARK: - Properties
///
///         let backgroundColor: UIColor
///         let titleColor: UIColor
///         let titleFont: UIFont
///         let tintColor: UIColor
///     }
///
/// Now, you should define a place where all of your app appearance types
/// will be stored:
///
///     // MARK: - Appearance
///
///     protocol Appearance: AnyAppearance {
///
///         /// Current appearance type
///         var type: AnyAppearanceType { get }
///
///         /// EnvironmentViewControllerAppearance instance
///         var environmentViewControllerAppearance: EnvironmentViewControllerAppearance { get }
///
///         /// EnvironmentCellAppearance instance
///         var environmentCellAppearance: EnvironmentCellAppearance { get }
///     }
///
/// And then, implement your global appearance types like light:
///
///     // MARK: - Light
///
///     struct Light {
///
///         // MARK: - Properties
///
///         /// Accent (tint) color
///         private let accent: UIColor
///
///         /// Main text color which should be shown over the `backgroundColor`
///         private let plainTextColor = UIColor(hexString: "#000000")
///
///         /// Main background color in the app
///         private let backgroundColor = UIColor(hexString: "#F2F2F7")
///
///         /// Workpieces background color.
///         /// Workpiece is a UIView subclass which looks like some
///         /// geometry shape. So we need a slightly contrasting color
///         /// for these views, `workpieceColor` is supposed to solve it.
///         private let workpieceColor = UIColor(hexString: "#FFFFFF")
///
///         // MARK: - Initializers
///
///         init(accent: UIColor) {
///             self.accent = accent
///         }
///     }
///
///     // MARK: - Appearance
///
///     extension Light: Appearance {
///
///         var type: AnyAppearanceType {
///             .light
///         }
///
///         var environmentViewControllerAppearance: EnvironmentViewControllerAppearance {
///             EnvironmentViewControllerAppearance(
///                 backgroundColor: backgroundColor,
///                 titleColor: plainTextColor,
///                 titleFont: .SFProSemibold(ofSize: 17),
///                 tintColor: accent
///             )
///         }
///
///         var environmentCellAppearance: EnvironmentCellAppearance {
///             EnvironmentCellAppearance(
///                 backgroundColor: workpieceColor,
///                 environmentLabelFont: .SFProRegular(ofSize: 17),
///                 environmentLabelColor: plainTextColor,
///                 tintColor: accent
///             )
///         }
///     }
///
/// And dark:
///
///     // MARK: - Dark
///
///     struct Dark {
///
///         // MARK: - Properties
///
///         /// Accent (tint) color
///         private let accent: UIColor
///
///         /// Main text color which should be shown over the `backgroundColor`
///         private let plainTextColor = UIColor.white
///
///         /// Main background color in the app
///         private let backgroundColor = UIColor.black
///
///         /// Workpieces background color.
///         /// Workpiece is a UIView subclass which looks like some
///         /// geometry shape. So we need a slightly contrasting color
///         /// for these views, `workpieceColor` is supposed to solve it.
///         private let workpieceColor = UIColor(hexString: "#1C1C1D")
///
///         // MARK: - Initializers
///
///         init(accent: UIColor) {
///             self.accent = accent
///         }
///     }
///
///     // MARK: - Appearance
///
///     extension Dark: Appearance {
///
///         var type: AnyAppearanceType {
///             AppearanceType.dark
///         }
///
///         var environmentViewControllerAppearance: EnvironmentViewControllerAppearance {
///             EnvironmentViewControllerAppearance(
///                 backgroundColor: backgroundColor,
///                 titleColor: plainTextColor,
///                 titleFont: .SFProSemibold(ofSize: 17),
///                 tintColor: accent
///             )
///         }
///
///         var environmentCellAppearance: EnvironmentCellAppearance {
///             EnvironmentCellAppearance(
///                 backgroundColor: workpieceColor,
///                 environmentLabelFont: .SFProRegular(ofSize: 17),
///                 environmentLabelColor: plainTextColor,
///                 tintColor: accent
///             )
///         }
///     }
///
///
public protocol AnyAppearance {

    /// Current appearance type
    var type: AnyAppearanceType { get }
}
