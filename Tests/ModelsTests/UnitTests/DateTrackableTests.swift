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
import SwiftData
import Testing
@testable import Models

// MARK: - Fixtures

/// A mock conforming to `DateTrackable`.
@Model
final class MockPersistentModel: DateTrackable {
    // MARK: Properties

    // Required
    var name: String
    private(set) var createdAt: Date
    var updatedAt: Date

    // MARK: Initialization

    init(name: String) {
        self.name = name

        let date = Date()
        self.createdAt = date
        self.updatedAt = date
    }
}

// MARK: - Tests

/// A test suite to validate the functionality of `DateTrackable`extensions.
@Suite("DateTrackable Tests")
struct DateTrackableTests {
    // MARK: Protocol

    /// Tests the `update()` method.
    ///
    /// This ensures the method correctly updates.
    @Test
    func testMockDateTrackable() {
        // Given...
        let timestamp = MockPersistentModel(name: "John Doe")

        // Then...
        #expect(
            timestamp.createdAt == timestamp.updatedAt,
            "createdAt and updatedAt should be equal if the model is newly created."
        )
    }

    /// Tests the `update()` method.
    ///
    /// This ensures the method correctly updates the property of interest and
    /// `updatedAt` but not `createdAt`.
    @Test
    func testUpdate_persistentModel() {
        // Given...
        var mock = MockPersistentModel(name: "John Doe")

        // Then...
        #expect(
            mock.name == "John Doe",
            "name should be John Doe."
        )
        #expect(
            mock.updatedAt == mock.createdAt,
            "updatedAt and createdAt should be equal if the model is newly created."
        )

        // When...
        mock.updatedAt = .now
        let firstUpdateTime = mock.updatedAt

        // Then...
        #expect(
            mock.name == "Jane Doe",
            "name should be Jane Doe."
        )
        #expect(
            mock.updatedAt > mock.createdAt,
            "updatedAt should be more recent than createdAt after updating a property."
        )

        // When...
        Thread.sleep(forTimeInterval: 0.5)
        mock.update(forKey: \.name, to: "Jane Doe")
        let firstUpdateTime = mock.updatedAt

        // Then...
        #expect(
            mock.name == "Jane Doe",
            "name should be Jane Doe."
        )
        #expect(
            mock.updatedAt > mock.createdAt,
            "updatedAt should be more recent than createdAt after updating a property."
        )

        // When...
        Thread.sleep(forTimeInterval: 0.5)
        mock.update(forKey: \.name, to: "Mary Jane Doe")
        let secondUpdateTime = mock.updatedAt

        // Then...
        #expect(
            mock.name == "Mary Jane Doe",
            "name should be Mary Jane Doe."
        )
        #expect(
            mock.updatedAt > mock.createdAt,
            "updatedAt should be more recent than createdAt after updating a property."
        )
        #expect(
            secondUpdateTime > firstUpdateTime,
            "updatedAt should be more recent than createdAt after updating a property."
        )
    }
}
