//
//  DateTrackable.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A protocol for conforming types to track when such types were created and
 updated.
*/

import Foundation

// MARK: - Public

/// A protocol for conforming types to track when such types were created and
/// updated.
///
/// This protocol defines properties that can be adopted by models as data
/// management metadata.
public protocol DateTrackable {
    /// When the model was created.
    var createdAt: Date? { get set }

    /// When the model was last updated.
    var updateAt: Date? { get set }
}

// MARK: - Public (Protocol Defaults)

public extension DateTrackable {
    /// Updates the `createdAt` and `updatedAt` properties.
    ///
    /// - If `createdAt` is `nil`, it is set to the current date and time.
    /// - `updatedAt` is always updated to the current date and time.
    mutating func trackDate() {
        let now = Date()
        if createdAt == nil { createdAt = now }
        updateAt = now
    }
}
