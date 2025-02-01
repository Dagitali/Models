//
//  DateTrackableTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `DateTrackable` protocol.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Fixtures

// A mock conforming to `DateTrackable`.
struct MockTimestamp: DateTrackable {
    // MARK: Properties

    // Optional
    var createdAt: Date?
    var updateAt: Date?
}

// MARK: - Tests

/// A test suite to validate the functionality of `DateTrackable`extensions.
@Suite("DateTrackable Tests")
struct DateTrackableTests {
    // MARK: Protocol

    /// Tests the `trackDate()` method, where `trackDate` sets both `createdAt`
    /// and `updatedAt` when `createdAt` is initially `nil`.
    ///
    /// This ensures the method correctly initializes timestamps when the model
    /// is first updated.
    @Test
    func testUpdateDateTracker_whenCreatedAtIsNil_setsCreatedAtAndUpdatedAt() {
        // Given...
        var timestamp = MockTimestamp()

        // When...
        timestamp.trackDate()

        // Then...
        #expect(
            timestamp.createdAt != nil,
            "createdAt should not be nil after trackDate()."
        )
        #expect(
            timestamp.updateAt != nil,
            "updatedAt should not be nil after trackDate()."
        )
        #expect(
            timestamp.createdAt == timestamp.updateAt,
            "createdAt and updatedAt should be equal if the model is newly created."
        )
    }

    /// Tests the `trackDate()` method, where `trackDate` updates only
    /// `updatedAt` while keeping `createdAt` unchanged when `createdAt` is
    /// already set.
    ///
    /// This ensures the method correctly handles updates without altering the
    /// original creation timestamp.
    @Test
    func testTrackDate_whenCreatedAtIsNotNil_updatesOnlyUpdatedAt() {
        // Given...
        let initialDate = Date(timeIntervalSinceNow: -3600) // 1 hour ago
        var timestamp = MockTimestamp(createdAt: initialDate, updateAt: initialDate)

        // When...
        timestamp.trackDate()

        // Then...
        #expect(
            timestamp.createdAt == initialDate,
            "createdAt should not change after calling trackDate() if it is already set."
        )
        #expect(
            timestamp.updateAt != initialDate,
            "updatedAt should be updated to the current date."
        )
        #expect(
            timestamp.updateAt! > initialDate,
            "updatedAt should be a later date than the initial date."
        )
    }

    /// Tests the `trackDate()` method, where `createdAt` remains constant
    /// across multiple calls to `trackDate` while `updatedAt` is updated each
    /// time.
    ///
    /// This ensures the method behaves consistently across repeated updates.
    @Test
    func testTrackDate_multipleUpdates_keepCreatedAtConstant() {
        // Given...
        var timestamp = MockTimestamp()

        // When...
        timestamp.trackDate()
        let firstUpdateTime = timestamp.updateAt

        // Simulate some delay.
        Thread.sleep(forTimeInterval: 0.5)

        // Simulate an update.
        timestamp.trackDate()
        let secondUpdateTime = timestamp.updateAt

        // Then...
        #expect(
            timestamp.createdAt != nil,
            "createdAt should not be nil after multiple updates."
        )
        #expect(
            timestamp.createdAt == firstUpdateTime,
            "createdAt should remain constant after multiple updates."
        )
        #expect(
            firstUpdateTime != secondUpdateTime,
            "updatedAt should change after subsequent updates."
        )
    }
}
