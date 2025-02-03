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

    /// Tests the `from` function.
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
