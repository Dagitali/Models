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
}
