//
//  TrackableTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `Trackable` protocol.
*/

import Foundation
import SwiftData
import Testing
@testable import Models

// MARK: - Fixtures

/// A `PersistentModel` mock conforming to `Trackable`.
@Model
final class MockPersistentModel: Trackable {
    // MARK: Properties

    // Required
    var name: String
    private(set) var createdAt: Date?
    var updatedAt: Date?

    // MARK: Initialization

    init(name: String) {
        self.name = name

        let date = Date()
        self.createdAt = date
        self.updatedAt = date
    }
}

/// A struct mock conforming to `Trackable`.
struct MockTransientModel: Trackable {
    // MARK: Properties

    // Required
    var name: String
    private(set) var createdAt: Date?
    var updatedAt: Date?

    // MARK: Initialization

    init(name: String) {
        self.name = name

        let date = Date()
        self.createdAt = date
        self.updatedAt = date
    }
}

// MARK: - Tests

/// A test suite to validate the functionality of `Trackable`extensions.
@Suite("Trackable Tests")
struct TrackableTests {
    // MARK: Protocol Defaults

    /// Tests the `update()` method on a `PersistentModel` type.
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
        Thread.sleep(forTimeInterval: 0.5)
        mock.update(forKey: \.name, to: "Jane Doe")
        let updatedAt1 = mock.updatedAt!

        // Then...
        #expect(
            mock.name == "Jane Doe",
            "name should be Jane Doe."
        )
        #expect(
            mock.updatedAt! > mock.createdAt!,
            "updatedAt should be more recent than createdAt after updating a property."
        )

        // When...
        Thread.sleep(forTimeInterval: 0.5)
        mock.update(forKey: \.name, to: "Mary Jane Doe")
        let updatedAt2 = mock.updatedAt!

        // Then...
        #expect(
            mock.name == "Mary Jane Doe",
            "name should be Mary Jane Doe."
        )
        #expect(
            mock.updatedAt! > mock.createdAt!,
            "updatedAt should be more recent than createdAt after updating a property."
        )
        #expect(
            updatedAt2 > updatedAt1,
            "updatedAt #2 should be more recent than updatedAt #1 after updating a property."
        )

        // When...
        Thread.sleep(forTimeInterval: 0.5)
        mock.updatedAt = .now
        let updatedAt3 = mock.updatedAt

        // Then...
        #expect(
            mock.name == "Mary Jane Doe",
            "name should be Mary Jane Doe."
        )
        #expect(
            mock.updatedAt! > mock.createdAt!,
            "updatedAt should be more recent than createdAt after directly updating updatedAt."
        )
        #expect(
            updatedAt3! > updatedAt2,
            "updatedAt #3 should be more recent than updatedAt #2 after updating a property."
        )
    }

    /// Tests the `update()` method on a struct.
    ///
    /// This ensures the method correctly updates the property of interest and
    /// `updatedAt` but not `createdAt`.
    @Test
    func testUpdate_struct() {
        // Given...
        var mock = MockTransientModel(name: "John Doe")

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
        Thread.sleep(forTimeInterval: 0.5)
        mock.update(forKey: \.name, to: "Jane Doe")
        let updatedAt1 = mock.updatedAt!

        // Then...
        #expect(
            mock.name == "Jane Doe",
            "name should be Jane Doe."
        )
        #expect(
            mock.updatedAt! > mock.createdAt!,
            "updatedAt should be more recent than createdAt after updating a property."
        )

        // When...
        Thread.sleep(forTimeInterval: 0.5)
        mock.update(forKey: \.name, to: "Mary Jane Doe")
        let updatedAt2 = mock.updatedAt!

        // Then...
        #expect(
            mock.name == "Mary Jane Doe",
            "name should be Mary Jane Doe."
        )
        #expect(
            mock.updatedAt! > mock.createdAt!,
            "updatedAt should be more recent than createdAt after updating a property."
        )
        #expect(
            updatedAt2 > updatedAt1,
            "updatedAt #2 should be more recent than updatedAt #1 after updating a property."
        )

        // When...
        Thread.sleep(forTimeInterval: 0.5)
        mock.updatedAt = .now
        let updatedAt3 = mock.updatedAt!

        // Then...
        #expect(
            mock.name == "Mary Jane Doe",
            "name should be Mary Jane Doe."
        )
        #expect(
            mock.updatedAt! > mock.createdAt!,
            "updatedAt should be more recent than createdAt after directly updating updatedAt."
        )
        #expect(
            updatedAt3 > updatedAt2,
            "updatedAt #3 should be more recent than updatedAt #2 after updating a property."
        )
    }
}
