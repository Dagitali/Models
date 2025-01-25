//
//  Timestampable.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A protocol for conforming types to model timestamp tracking for creation and
 updates.
*/

import SwiftUI

// MARK: - Public

/// A protocol for conforming types to model timestamp tracking for creation
/// and updates.
///
/// This protocol defines properties for managing the creation and update
/// timestamps of a model. It can be adopted by models to standardize the
/// handling of these timestamps in your app.
public protocol Timestampable {
    /// The timestamp when the model was created.
    var createdAt: Date? { get set }

    /// The timestamp when the model was last updated.
    var updatedAt: Date? { get set }
}

// MARK: - Public (Protocol Defaults)

public extension Timestampable {
    /// Updates the `createdAt` and `updatedAt` timestamps for the model.
    ///
    /// - If `createdAt` is `nil`, it is set to the current date and time.
    /// - `updatedAt` is always updated to the current date and time.
    mutating func updateTimestamps() {
        let now = Date()
        if createdAt == nil { createdAt = now }
        updatedAt = now
    }
}
