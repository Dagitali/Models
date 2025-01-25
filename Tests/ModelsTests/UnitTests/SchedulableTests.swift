//
//  SchedulableTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `Schedulablable` protocol.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Fixtures

// A mock conforming to `Schedulablable`.
struct MockEvent: Schedulable {
    // MARK: Properties

    // Required
    var start: Date
    var end: Date
}

// MARK: - Tests

/// A test suite to validate the functionality of the `Schedulable` protocol.
@Suite("Schedulable Tests")
struct SchedulableTests {
    // MARK: Properties

    /// Tests the `duration` property.
    ///
    /// This ensures the property calculates the correct time interval.
    @Test
    func testDuration() {
        // Given...
        let start = Date()
        let end = start.addingTimeInterval(3600)

        // When...
        let event = MockEvent(start: start, end: end)

        // Then...
        #expect(
            event.duration == 3600,
            "The duration should equal the expected value."
        )
    }

    // MARK: Functions

    /// Tests the `overlap()` method.
    ///
    /// This ensures it correctly detects overlapping events.
    @Test
    func testOverlap() {
        // Given...
        let start1 = Date()
        let end1 = start1.addingTimeInterval(3600)
        let start2 = start1.addingTimeInterval(1800)
        let end2 = start2.addingTimeInterval(3600)

        // When...
        let event1 = MockEvent(start: start1, end: end1)
        let event2 = MockEvent(start: start2, end: end2)

        // Then...
        #expect(
            event1.isOverlapping(with: event2) == true,
            "The events should overlap."
        )
    }
}
