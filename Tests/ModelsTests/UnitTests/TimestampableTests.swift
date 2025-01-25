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
    var createdAt: Date?
    var updatedAt: Date?
}

// MARK: - Tests

/// A test suite to validate the functionality of `TimestampedModel`
/// extensions.
@Suite("Timestampable Tests")
struct TimestampableTests {
    // MARK: Protocol

    /// Tests the `updateTimestamps()` method, where `updateTimestamps` sets
    /// both `createdAt` and `updatedAt` when `createdAt` is initially `nil`.
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
            timestamp.createdAt != nil,
            "createdAt should not be nil after updateTimestamps."
        )
        #expect(
            timestamp.updatedAt != nil,
            "updatedAt should not be nil after updateTimestamps."
        )
        #expect(
            timestamp.createdAt == timestamp.updatedAt,
            "createdAt and updatedAt should be equal if the model is newly created."
        )
    }

    /// Tests the `updateTimestamps()` method, where `updateTimestamps` updates
    /// only `updatedAt` while keeping `createdAt` unchanged when `createdAt`
    /// is already set.
    ///
    /// This ensures the method correctly handles updates  without altering the
    /// original creation timestamp.
    @Test
    func testUpdateTimestamps_whenCreatedAtIsNotNil_updatesOnlyUpdatedAt() {
        // Given...
        let initialDate = Date(timeIntervalSinceNow: -3600) // 1 hour ago
        var timestamp = MockTimestamp(createdAt: initialDate, updatedAt: initialDate)

        // When...
        timestamp.updateTimestamps()

        // Then...
        #expect(
            timestamp.createdAt == initialDate,
            "createdAt should not change after calling updateTimestamps if it is already set."
        )
        #expect(
            timestamp.updatedAt != initialDate,
            "updatedAt should be updated to the current date."
        )
        #expect(
            timestamp.updatedAt! > initialDate,
            "updatedAt should be a later date than the initial date."
        )
    }

    /// Tests the `updateTimestamps()` method, where `createdAt` remains
    /// constant across multiple calls to `updateTimestamps` while `updatedAt`
    /// is updated each time.
    ///
    /// This ensures the method behaves consistently across repeated updates.
    @Test
    func testUpdateTimestamps_multipleUpdates_keepCreatedAtConstant() {
        // Given...
        var timestamp = MockTimestamp()

        // When...
        timestamp.updateTimestamps()
        let firstUpdateTime = timestamp.updatedAt

        // Simulate some delay.
        Thread.sleep(forTimeInterval: 0.5)

        // Simulate an update.
        timestamp.updateTimestamps()
        let secondUpdateTime = timestamp.updatedAt

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
