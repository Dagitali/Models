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

/// A protocol for tracking the creation and last update timestamps of
/// conforming types.
///
/// This protocol defines metadata properties that can be used by models to
/// record when instances were created and last modified.
///
/// ## Example
/// ```swift
/// struct User: Trackable {
///     var createdAt: Date
///     var updatedAt: Date
///     var name: String
/// }
///
/// var user = User(createdAt: Date(), updatedAt: Date(), name: "Alice")
/// user.update(forKey: \.name, to: "Bob")
/// print(user.updatedAt) // Prints the updated timestamp.
/// ```
@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public protocol Trackable {

    /// The timestamp indicating when an instance of the conforming type was
    /// created.
    ///
    /// This property is optional and may be `nil` if the creation date is not
    /// explicitly set.
    var createdAt: Date { get }

    /// The timestamp indicating when an instance of the conforming type was
    /// last updated.
    ///
    /// This property is optional and may be `nil` if the creation date is not
    /// explicitly set.  Also, implementations should update this property
    /// whenever a modification occurs.
    var updatedAt: Date { get set }
}

// MARK: - Public (Protocol Defaults)

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Trackable {
    /// Updates a writable property of the conforming type and records the last
    /// update timestamp.
    ///
    /// - Parameters:
    ///   - keyPath: A writable key path to the property that should be
    ///     updated.
    ///   - newValue: The new value to assign to the specified property.
    ///
    /// This method assigns the new value to the specified property and updates
    /// `updatedAt` to the current timestamp (`.now`).
    ///
    /// ## Example
    /// ```swift
    /// struct Player: Trackable {
    ///     var createdAt: Date
    ///     var updatedAt: Date
    ///     var score: Int
    /// }
    ///
    /// var player = Player(createdAt: Date(), updatedAt: Date(), score: 100)
    /// player.update(forKey: \.score, to: 150)
    /// print(player.updatedAt) // Prints the updated timestamp
    /// ```
    mutating func update<Value>(forKey keyPath: WritableKeyPath<Self, Value>, to newValue: Value) {
        self[keyPath: keyPath] = newValue

        updatedAt = .now
    }
}

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Trackable where Self : PersistentModel {
    /// Updates a reference-writable property and records the last update
    /// timestamp.
    ///
    /// - Parameters:
    ///   - keyPath: A reference-writable key path to the property that should
    ///     be updated.
    ///   - newValue: The new value to assign to the specified property.
    ///
    /// If the instance is marked as deleted (`isDeleted` is `true`), the
    /// `updatedAt` timestamp is **not** updated to prevent unnecessary
    /// modifications to deleted objects.
    ///
    /// ## Example
    /// ```swift
    /// @Model
    /// final class Task: PersistentModel, Trackable {
    ///     var createdAt: Date
    ///     var updatedAt: Date
    ///     var title: String
    ///     var isDeleted: Bool = false
    /// }
    ///
    /// let task = Task(createdAt: Date(), updatedAt: Date(), title: "Buy groceries")
    /// task.update(forKey: \.title, to: "Buy groceries and cook dinner")
    /// print(task.updatedAt) // Prints the updated timestamp.
    /// ```
    mutating func update<Value>(forKey keyPath: ReferenceWritableKeyPath<Self, Value>, to newValue: Value) {
        self[keyPath: keyPath] = newValue

        if !isDeleted {
            updatedAt = .now
        }
    }

    /// Updates a writable property of the conforming type and records the last
    /// update timestamp.
    ///
    /// - Parameters:
    ///   - keyPath: A writable key path to the property that should be
    ///     updated.
    ///   - newValue: The new value to assign to the specified property.
    ///
    /// This method behaves similarly to `update(forKey:to:)`, but applies to
    /// standard writable key paths. If the instance is marked as deleted
    /// (`isDeleted` is `true`), the `updatedAt` timestamp is **not** updated
    /// to prevent unnecessary modifications to deleted objects.
    ///
    /// ## Example
    /// ```swift
    /// @Model
    /// final class Note: PersistentModel, Trackable {
    ///     var createdAt: Date
    ///     var updatedAt: Date
    ///     var content: String
    ///     var isDeleted: Bool = false
    /// }
    ///
    /// let note = Note(createdAt: Date(), updatedAt: Date(), content: "Meeting at 10 AM")
    /// note.update(forKey: \.content, to: "Meeting rescheduled to 11 AM")
    /// print(note.updatedAt) // Prints the updated timestamp
    /// ```
    mutating func update<Value>(forKey keyPath: WritableKeyPath<Self, Value>, to newValue: Value) {
        self[keyPath: keyPath] = newValue

        if !isDeleted {
            updatedAt = .now
        }
    }
}
