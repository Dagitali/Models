//
//  GenderTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `Gender` enum.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Tests

/// A test suite to validate the functionality of the `Gender` enum.
@Suite("Gender Tests")
struct GenderTests {
    // MARK: Protocol Conformance (CaseIterable)

    /// Tests conformance to the `CaseIterable` protocol.
    ///
    /// This ensures all of the `Gender` cases are iterated.
    @Test
    func testAllCases() {
        // Given...
        let expected: [Gender] = [.female, .male, .nonBinary, .unspecified]

        // When...
        let actual = Gender.allCases

        // Then...
        #expect(
            actual == expected,
            "`Gender.allCases` does not contain all expected cases."
        )
    }

    // MARK: Protocol Conformance (Codable)

    /// Tests conformance to the `Codable` protocol.
    ///
    /// This ensures the `Gender` is both encodable and decodable.
    @Test
    func testCodable() throws {
        // Given...
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let original = Gender.unspecified

        // When...
        let encoded = try encoder.encode(original)
        let decoded = try decoder.decode(Gender.self, from: encoded)

        // Then...
        #expect(
            original == decoded,
            "Encoding/decoding failed for `Gender`."
        )
    }

    // MARK: Computed Properties

    /// Tests the `isFemale` property.
    ///
    /// This ensures the property correctly indicates that the gender is
    /// categorized as female.
    @Test
    func testIsFemale() {
        // Given...
        let expectedF = true
        let expectedM = false
        let expectedNB = false
        let expectedU = false

        // When...
        let actualF = Gender.female.isFemale
        let actualM = Gender.male.isFemale
        let actualNB = Gender.nonBinary.isFemale
        let actualU = Gender.unspecified.isFemale

        // Then...
        #expect(
            actualF == expectedF,
            "The gender's `isFemale` value should be \(expectedF), not \(actualF)."
        )
        #expect(
            actualM == expectedM,
            "The gender's `isFemale` value should be \(expectedM), not \(actualM)."
        )
        #expect(
            actualNB == expectedNB,
            "The gender's `isFemale` value should be \(expectedNB), not \(actualNB)."
        )
        #expect(
            actualU == expectedU,
            "The gender's `isFemale` value should be \(expectedU), not \(actualU)."
        )
    }

    /// Tests the `isMale` property.
    ///
    /// This ensures the property correctly indicates that the gender is
    /// categorized as male.
    @Test
    func testIsMale() {
        // Given...
        let expectedF = false
        let expectedM = true
        let expectedNB = false
        let expectedU = false

        // When...
        let actualF = Gender.female.isMale
        let actualM = Gender.male.isMale
        let actualNB = Gender.nonBinary.isMale
        let actualU = Gender.unspecified.isMale

        // Then...
        #expect(
            actualF == expectedF,
            "The gender's `isMale` value should be \(expectedF), not \(actualF)."
        )
        #expect(
            actualM == expectedM,
            "The gender's `isMale` value should be \(expectedM), not \(actualM)."
        )
        #expect(
            actualNB == expectedNB,
            "The gender's `isMale` value should be \(expectedNB), not \(actualNB)."
        )
        #expect(
            actualU == expectedU,
            "The gender's `isMale` value should be \(expectedU), not \(actualU)."
        )
    }

    /// Tests the `isNonBinary` property.
    ///
    /// This ensures the property correctly indicates that the gender is
    /// categorized as non-binary.
    @Test
    func testIsNonBinary() {
        // Given...
        let expectedF = false
        let expectedM = false
        let expectedNB = true
        let expectedU = false

        // When...
        let actualF = Gender.female.isNonBinary
        let actualM = Gender.male.isNonBinary
        let actualNB = Gender.nonBinary.isNonBinary
        let actualU = Gender.unspecified.isNonBinary

        // Then...
        #expect(
            actualF == expectedF,
            "The gender's `isNonBinary` value should be \(expectedF), not \(actualF)."
        )
        #expect(
            actualM == expectedM,
            "The gender's `isNonBinary` value should be \(expectedM), not \(actualM)."
        )
        #expect(
            actualNB == expectedNB,
            "The gender's `isNonBinary` value should be \(expectedNB), not \(actualNB)."
        )
        #expect(
            actualU == expectedU,
            "The gender's `isNonBinary` value should be \(expectedU), not \(actualU)."
        )
    }

    /// Tests the `isUnspecified` property.
    ///
    /// This ensures the property correctly indicates that the gender is
    /// categorized as unspecified.
    @Test
    func testIsUnspecified() {
        // Given...
        let expectedF = false
        let expectedM = false
        let expectedNB = false
        let expectedU = true

        // When...
        let actualF = Gender.female.isUnspecified
        let actualM = Gender.male.isUnspecified
        let actualNB = Gender.nonBinary.isUnspecified
        let actualU = Gender.unspecified.isUnspecified

        // Then...
        #expect(
            actualF == expectedF,
            "The gender's `isUnspecified` value should be \(expectedF), not \(actualF)."
        )
        #expect(
            actualM == expectedM,
            "The gender's `isUnspecified` value should be \(expectedM), not \(actualM)."
        )
        #expect(
            actualNB == expectedNB,
            "The gender's `isUnspecified` value should be \(expectedNB), not \(actualNB)."
        )
        #expect(
            actualU == expectedU,
            "The gender's `isUnspecified` value should be \(expectedU), not \(actualU)."
        )
    }

    // MARK: Functions

    /// Tests the `from` function with respect to an age bracket's boundaries.
    ///
    /// This ensures the function correctly selects the age bracket for a given
    /// age and organization. even at age bracket's boundaries.
    @Test
    func testFrom_BoundaryConditions() {
        // Given...
        let expected1 = AgeBracket.toddlerCDC
        let expected3 = AgeBracket.preschoolerCDC
        let expected6 = AgeBracket.childCDC
        let expected12 = AgeBracket.teenagerCDC
        let expected18 = AgeBracket.youngAdultCDC
        let expected25 = AgeBracket.adultCDC

        // When...
        let actual1 = AgeBracket.from(age: 1, organization: .cdc)
        let actual3 = AgeBracket.from(age: 3, organization: .cdc)
        let actual5dot9 = AgeBracket.from(age: 5.9, organization: .cdc)
        let actual6 = AgeBracket.from(age: 6, organization: .cdc)
        let actual11dot9 = AgeBracket.from(age: 11.9, organization: .cdc)
        let actual12 = AgeBracket.from(age: 12, organization: .cdc)
        let actual17dot9 = AgeBracket.from(age: 17.9, organization: .cdc)
        let actual18 = AgeBracket.from(age: 18, organization: .cdc)
        let actual24dot9 = AgeBracket.from(age: 24.9, organization: .cdc)
        let actual25 = AgeBracket.from(age: 25, organization: .cdc)

        // Then...
        #expect(
            actual1 == expected1,
            "An age of 1 should return \(expected1), not \(actual1)."
        )
        #expect(
            actual3 == expected3,
            "An age of 3 should return \(expected3), not \(actual3)."
        )
        #expect(
            actual5dot9 == expected3,
            "An age of 5.9 should return \(expected3), not \(actual5dot9)."
        )
        #expect(
            actual6 == expected6,
            "An age of 6 should return \(expected6), not \(actual6)."
        )
        #expect(
            actual11dot9 == expected6,
            "An age of 11.9 should return \(expected6), not \(actual11dot9)."
        )
        #expect(
            actual12 == expected12,
            "An age of 12 should return \(expected12), not \(actual12)."
        )
        #expect(
            actual17dot9 == expected12,
            "An age of 17.9 should return \(expected12), not \(actual17dot9)."
        )
        #expect(
            actual18 == expected18,
            "An age of 18 should return \(expected18), not \(actual18)."
        )
        #expect(
            actual24dot9 == expected18,
            "An age of 24.9 should return \(expected18), not \(actual24dot9)."
        )
        #expect(
            actual25 == expected25,
            "An age of 25 should return \(expected25), not \(actual25)."
        )
    }

    /// Tests the `from` function with respect to numeric types.
    ///
    /// This ensures the function correctly selects the age bracket for a given
    /// age and organization. regardless of the data type used for the age.
    @Test
    func testFrom_NumericTypes() {
        // Given...
        let expectedI = AgeBracket.childCDC
        let expectedF = AgeBracket.youngAdultCDC
        let expectedD = AgeBracket.seniorCDC

        // When...
        let actualI = AgeBracket.from(age: Int(10), organization: .cdc)
        let actualF = AgeBracket.from(age: Float(20.5), organization: .cdc)
        let actualD = AgeBracket.from(age: Double(65.2), organization: .cdc)

        // Then...
        #expect(
            actualI == expectedI,
            "An age of 10 should return \(expectedI), not \(actualI)."
        )
        #expect(
            actualF == expectedF,
            "An age of 20.5 should return \(expectedF), not \(actualF)."
        )
        #expect(
            actualD == expectedD,
            "An age of 65.2 should return \(expectedD), not \(actualD)."
        )
    }
}
