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
        birthDate: Calendar.current.date(byAdding: .year, value: -30, to: .now)!
    )
    let child = MockPerson(
        firstName: "Jane",
        lastName: "Doe",
        birthDate: Calendar.current.date(byAdding: .year, value: -10, to: .now)!
    )

    // MARK: Computed Properties

    /// Tests the `birthday` computed property.
    ///
    /// This ensures it correctly formats the birth date.
    @Test
    func testBirthday() {
        // Given...
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        let expected = formatter.string(from: .now)

        // When...
        let actual = adult.birthday

        // Then...
        #expect(
            actual == expected,
            "The birthday should be \(expected), not \(actual)."
        )
    }

    /// Tests the `fullName` computed property.
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
            "The full name should be \(expected), not \(actual)."
        )
    }

    /// Tests the `initials` computed property.
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
            "The initials should be \(expected), not \(actual)."
        )
    }

    /// Tests the `isAdult` computed property.
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
            "The adult's adult status should be \(expectedA), not \(actualA)."
        )
        #expect(
            actualC == expectedC,
            "The child's adult status should be \(expectedC), not \(actualC)."
        )
    }

    // MARK: Methods

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
            "The age should be \(expected), not \(actual)."
        )
    }

    /// Tests the `formattedBirthDate()` method.
    ///
    /// This ensures it correctly formats the birth date.
    @Test
    func testFormattedBirthDate() {
        // Given...
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let date = Calendar.current.date(byAdding: .year, value: -30, to: .now)!
        let expected = formatter.string(from: date)

        // When...
        let actual = adult.formattedBirthDate(style: .medium)

        // Then...
        #expect(
            actual == expected,
            "The  birth date should be \(expected), not \(actual)."
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
            "The formatted name should be \(expectedL), not \(actualL)."
        )
        #expect(
            actualM == expectedM,
            "The formatted name should be \(expectedM), not \(actualM)."
        )
        #expect(
            actualS == expectedS,
            "The formatted name should be \(expectedS), not \(actualS)."
        )
    }
}
