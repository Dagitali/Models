//
//  AgeBracketTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `AgeBracket` enum.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Tests

/// A test suite to validate the functionality of the `AgeBracket` enum.
@Suite("AgeBracket Tests")
struct AgeBracketTests {
    // MARK: Computed Properties

    /// Tests the `isAdult` property.
    ///
    /// This ensures the property correctly computes the adult status.
    @Test
    func testIsAdult() {
        // Given...
        let expectedA = true
        let expectedC = false

        // When...
        let actualA = AgeBracket.seniorCDC.isAdult
        let actualC = AgeBracket.infantCDC.isAdult

        // Then...
        #expect(
            actualA == expectedA,
            "The adult age bracket's `isAdult` value should be \(expectedA), not \(actualA)."
        )
        #expect(
            actualC == expectedC,
            "The child age bracket's `isAdult` value should be \(expectedC), not \(actualC)."
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
