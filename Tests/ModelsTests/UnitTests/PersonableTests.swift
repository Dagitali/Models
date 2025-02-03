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
    var middleName: String?
    var namePrefix: String?
    var nameSuffix: String?
    var nickname: String?
    var birthDate: Date?
}

// MARK: - Tests

/// A test suite to validate the functionality of the `Personable` protocol.
@Suite("Personable Tests")
struct PersonableTests {
    // MARK: Mocks

    let adult = MockPerson(
        firstName: "John",
        lastName: "Doe",
        nameSuffix: "Jr.",
        birthDate: Calendar.current.date(byAdding: .year, value: -30, to: Date())!
    )
    let child = MockPerson(
        firstName: "Jane",
        lastName: "Doe",
        birthDate: Calendar.current.date(byAdding: .year, value: -10, to: Date())!
    )

    // MARK: Properties

    /// Tests the `fullName` property.
    ///
    /// This ensures the property correctly combines the first and last names.
    @Test
    func testFullName() {
        // Given...
        let expected = "John Doe"

        // When...
        let actual = adult.fullName

        // Then...
        #expect(
            adult.fullName == "John Doe",
            "The full name (\(actual)) should equal the expected full name (\(expected))."
        )
    }

    /// Tests the `initials` property.
    ///
    /// This ensures the property correctly abbreviates the name.
    @Test
    func testInitials() {
        // Given...
        let expected = "JD"

        // When...
        let actual = adult.initials

        // Then...
        #expect(
            actual == expected,
            "The actual initials (\(actual)) should equal the expected initials (\(expected))."
        )
    }

    /// Tests the `isAdult` property.
    ///
    /// This ensures the property correctly computes the adult status.
    @Test
    func testIsAdult() {
        // Given...
        let expectedA = true
        let expectedC = false

        // When...
        let actualA = adult.isAdult
        let actualC = child.isAdult

        // Then...
        #expect(
            actualA == expectedA,
            "The adult's actual adult status (\(actualA)) should equal their expected adult status (\(expectedA))."
        )
        #expect(
            actualC == expectedC,
            "The child's actual adult status (\(actualC)) should equal their expected adult status (\(expectedC))."
        )
    }

    // MARK: Functions

    /// Tests the `age()` method.
    ///
    /// This ensures it calculates the correct age based on the date of birth.
    @Test
    func testAge() {
        // Given...
        let expected = 30

        // When...
        let actual = adult.age()!

        // Then...
        #expect(
            actual == expected,
            "The actual age (\(actual)) should equal the expected age (\(expected))."
        )
    }

    /// Tests the `formattedName()` method.
    ///
    /// This ensures it correctly formats the name.
    @Test
    func testFormattedName() {
        // Given...
        let expectedL = "John Doe Jr."
        let expectedM = "John Doe"
        let expectedS = "John"

        // When...
        let actualL = adult.formattedName(style: .long)
        let actualM = adult.formattedName(style: .medium)
        let actualS = adult.formattedName(style: .short)

        // Then...
        #expect(
            actualL == expectedL,
            "The actual formatted name (\(actualL)) should equal the expected formatted name (\(expectedL))."
        )
        #expect(
            actualM == expectedM,
            "The actual formatted name (\(actualM)) should equal the expected formatted name (\(expectedM))."
        )
        #expect(
            actualS == expectedS,
            "The actual formatted name (\(actualS) should equal the expected formatted name (\(expectedS))."
        )
    }
}
