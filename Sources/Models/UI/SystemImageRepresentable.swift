//
//  SystemImageRepresentable.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A protocol for providing an SF Symbol representation of a type.
*/

import Foundation

// MARK: - Public

/// A protocol for providing an SF Symbol representation of a type.
///
/// This protocol allows models to specify an associated SF Symbol name,
/// which can be used to visually represent instances of the conforming type
/// in UI components such as pickers and buttons.
///
/// ## Example
/// ```swift
/// struct Tab: SystemImageRepresentable {
///     var name: String
///     var systemImageName: String
/// }
///
/// let tab = Tab(name: "Events", systemImageName: "calendar")
/// ```
@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public protocol SystemImageRepresentable {

    /// The name of the SF Symbol that visually represents an instance
    /// of the conforming type.
    ///
    /// This property allows UI components to display a corresponding
    /// system image, improving the clarity and consistency of the user
    /// interface.
    var systemImageName: String { get }
}
