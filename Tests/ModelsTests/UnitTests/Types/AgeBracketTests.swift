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
    // MARK: Protocol Conformance (CaseIterable)

    /// Tests conformance to the `CaseIterable` protocol.
    ///
    /// This ensures all of the `AgeBracket` cases are iterated.
    @Test
    func testAllCases() {
        // Given...
        let expected: [AgeBracket] = [
            // Centers for Disease Control (CDC)
            .infantCDC, .toddlerCDC, .preschoolerCDC, .childCDC, .teenagerCDC,
            .youngAdultCDC, .adultCDC, .middleAgedCDC, .seniorCDC,

            // U.S. Census
            .infantCensus, .toddlerCensus, .childCensus, .youthCensus,
            .youngAdultCensus, .middleAgedCensus, .seniorCensus, .seniorMiddleOldCensus, .seniorOldestOldCensus,

            // World Health Organization (WHO)
            .infantWHO, .earlyChildhoodWHO, .childhoodWHO, .adolescentWHO,
            .youngAdultWHO, .middleAgedWHO, .seniorWHO
        ]

        // When...
        let actual = AgeBracket.allCases

        // Then...
        #expect(
            actual == expected,
            "`AgeBracket.allCases` does not contain all expected cases."
        )
    }

    // MARK: Protocol Conformance (Codable)

    /// Tests conformance to the `Codable` protocol.
    ///
    /// This ensures the `AgeBracket` is both encodable and decodable.
    @Test
    func testCodable() throws {
        // Given...
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let original = AgeBracket.seniorCDC

        // When...
        let encoded = try encoder.encode(original)
        let decoded = try decoder.decode(AgeBracket.self, from: encoded)

        // Then...
        #expect(
            original == decoded,
            "Encoding/decoding failed for `AgeBracket`."
        )
    }

    // MARK: Computed Properties

    /// Tests the `isAdult` property.
    ///
    /// This ensures the property correctly indicates that the age bracket is categorized as adult.
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

    // MARK: Methods

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
