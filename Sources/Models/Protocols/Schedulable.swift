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
public protocol Schedulable {
    // MARK: Properties

    /// The start date and time of the event.
    var startAt: Date { get }

    /// The end date and time of the event.
    var endAt: Date { get }

    /// The duration of the event in seconds.
    var duration: TimeInterval { get }

    // MARK: Functions

    /// Checks whether this event overlaps with another conforming `Schedulable`
    /// instance.
    /// - Parameter other: Another `Schedulable` instance.
    /// - Returns: A Boolean value indicating whether the two events overlap.
    func isOverlapping(with other: Schedulable) -> Bool
}

// MARK: - Public (Protocol Defaults)

public extension Schedulable {
    // MARK: Computed Properties

    var duration: TimeInterval {
        return endAt.timeIntervalSince(startAt)
    }

    // MARK: Functions

    func isOverlapping(with other: Schedulable) -> Bool {
        return (startAt < other.endAt && endAt > other.startAt)
    }
}
