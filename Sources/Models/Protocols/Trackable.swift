//
//  Trackable.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A protocol for conforming types to track when such types were created and
 updated.

 References:
 1. https://fatbobman.com/en/posts/unveiling-the-data-modeling-principles-of-
    swiftdata/
 2. https://www.hackingwithswift.com/quick-start/swiftdata/how-to-create-
    derived-attributes-with-swiftdata
*/

import Foundation
import SwiftData

// MARK: - Public

/// A protocol for conforming types to track when such types were created and
/// updated.
///
/// This protocol defines properties that can be adopted by models as data
/// management metadata.
public protocol Trackable {
    /// The `Date` when an instance of the conforming type was created.
    var createdAt: Date { get }

    /// The `Date` when an iinstance of the conforming type was last updated.
    var updatedAt: Date { get set }
}

// MARK: - Public (Protocol Defaults)

public extension Trackable where Self : PersistentModel {
    /// Tracks when an instance of the conforming type was last updated.
    mutating func update<Value>(
        forKey keyPath: ReferenceWritableKeyPath<Self, Value>,
        to newValue: Value
    ) {
        self[keyPath: keyPath] = newValue

        if !isDeleted {
            updatedAt = .now
        }
    }
}
