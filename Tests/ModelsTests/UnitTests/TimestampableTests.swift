//
//  TimestampableTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `Timestampable` protocol.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Fixtures

// A mock conforming to `Timestampable`.
struct MockTimestamp: Timestampable {
    // MARK: Properties

    // Optional
    var createdDate: Date?
    var updatedDate: Date?
}

// MARK: - Tests

/// A test suite to validate the functionality of `TimestampedModel`
/// extensions.
@Suite("Timestampable Tests")
struct TimestampableTests {
    // MARK: Protocol

    /// Tests the `updateTimestamps()` method, where `updateTimestamps` sets
    /// both `createdDate` and `updatedDate` when `createdDate` is initially `nil`.
    ///
    /// This ensures the method correctly initializes timestamps when the
    /// model is first updated.
    @Test
    func testUpdateTimestamps_whenCreatedAtIsNil_setsCreatedAtAndUpdatedAt() {
        // Given...
        var timestamp = MockTimestamp()

        // When...
        timestamp.updateTimestamps()

        // Then...
        #expect(
            timestamp.createdDate != nil,
            "createdDate should not be nil after updateTimestamps."
        )
        #expect(
            timestamp.updatedDate != nil,
            "updatedDate should not be nil after updateTimestamps."
        )
        #expect(
            timestamp.createdDate == timestamp.updatedDate,
            "createdDate and updatedDate should be equal if the model is newly created."
        )
    }

    /// Tests the `updateTimestamps()` method, where `updateTimestamps` updates
    /// only `updatedDate` while keeping `createdDate` unchanged when `createdDate`
    /// is already set.
    ///
    /// This ensures the method correctly handles updates  without altering the
    /// original creation timestamp.
    @Test
    func testUpdateTimestamps_whenCreatedAtIsNotNil_updatesOnlyUpdatedAt() {
        // Given...
        let initialDate = Date(timeIntervalSinceNow: -3600) // 1 hour ago
        var timestamp = MockTimestamp(createdDate: initialDate, updatedDate: initialDate)

        // When...
        timestamp.updateTimestamps()

        // Then...
        #expect(
            timestamp.createdDate == initialDate,
            "createdDate should not change after calling updateTimestamps if it is already set."
        )
        #expect(
            timestamp.updatedDate != initialDate,
            "updatedDate should be updated to the current date."
        )
        #expect(
            timestamp.updatedDate! > initialDate,
            "updatedDate should be a later date than the initial date."
        )
    }

    /// Tests the `updateTimestamps()` method, where `createdDate` remains
    /// constant across multiple calls to `updateTimestamps` while `updatedDate`
    /// is updated each time.
    ///
    /// This ensures the method behaves consistently across repeated updates.
    @Test
    func testUpdateTimestamps_multipleUpdates_keepCreatedAtConstant() {
        // Given...
        var timestamp = MockTimestamp()

        // When...
        timestamp.updateTimestamps()
        let firstUpdateTime = timestamp.updatedDate

        // Simulate some delay.
        Thread.sleep(forTimeInterval: 0.5)

        // Simulate an update.
        timestamp.updateTimestamps()
        let secondUpdateTime = timestamp.updatedDate

        // Then...
        #expect(
            timestamp.createdDate != nil,
            "createdDate should not be nil after multiple updates."
        )
        #expect(
            timestamp.createdDate == firstUpdateTime,
            "createdDate should remain constant after multiple updates."
        )
        #expect(
            firstUpdateTime != secondUpdateTime,
            "updatedDate should change after subsequent updates."
        )
    }
}
