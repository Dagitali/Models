//
//  PersonableTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `Personable` protocol.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Fixtures

// A mock conforming to `Personable`.
struct MockPerson: Personable {
    // MARK: Properties

    // Required
    var firstName: String
    var lastName: String

    // Optional
    var birthDate: Date?
}

// MARK: - Tests

/// A test suite to validate the functionality of the `Personable` protocol.
@Suite("Personable Tests")
struct PersonableTests {
    // MARK: Properties

    /// Tests the `fullName` property.
    ///
    /// This ensures the property correctly combines the first and last names.
    @Test
    func testFullName() {
        // Given...
        let person = MockPerson(firstName: "John", lastName: "Doe")

        // Then...
        #expect(
            person.fullName == "John Doe",
            "The full name should equal the expected value."
        )
    }

    // MARK: Functions

    /// Tests the `age()` method.
    ///
    /// This ensures it calculates the correct age based on the date of birth.
    @Test
    func testAge() {
        // Given...
        let birthday = Calendar.current.date(byAdding: .year, value: -30, to: Date())!
        let person = MockPerson(firstName: "Jane", lastName: "Doe", birthDate: birthday)

        // Then...
        #expect(
            person.age() == 30,
            "The age should equal the expected value."
        )
    }
}
