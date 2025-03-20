//
//  Schedulable.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A protocol for conforming types to model an event or time slot.
*/

import Foundation

// MARK: - Public

/// A protocol for conforming types to model an event or time slot.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public protocol Schedulable {
    // MARK: Properties

    /// The start date and time of the event.
    var start: Date { get }

    /// The end date and time of the event.
    var end: Date { get }

    /// The duration of the event in seconds.
    var duration: TimeInterval { get }

    // MARK: Methods

    /// Checks whether this event overlaps with another conforming `Schedulable`
    /// instance.
    /// - Parameter other: Another `Schedulable` instance.
    /// - Returns: A Boolean value indicating whether the two events overlap.
    func isOverlapping(with other: Schedulable) -> Bool
}

// MARK: - Public (Protocol Defaults)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Schedulable {
    // MARK: Computed Properties

    var duration: TimeInterval {
        return end.timeIntervalSince(start)
    }

    // MARK: Methods

    func isOverlapping(with other: Schedulable) -> Bool {
        return (start < other.end && end > other.start)
    }
}
