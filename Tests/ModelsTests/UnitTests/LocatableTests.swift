//
//  LocatableTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `Locatable` protocol.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Fixtures

// A mock conforming to `Locatable`.
struct MockLocation: Locatable {
    // MARK: Properties

    // Required
    var latitude: Double
    var longitude: Double
}

// MARK: - Tests

/// A test suite to validate the functionality of the `Locatable` protocol.
@Suite("Locatable Tests")
struct LocatableTests {
    // MARK: Properties

    /// Tests the `coordinates` property.
    ///
    /// This ensures the property returns the correct latitude and longitude.
    @Test
    func testCoordinates() {
        // Given...
        let location = MockLocation(latitude: 40.748817, longitude: -73.985428)

        // When...
        let coordinates = location.coordinates

        // Then...
        #expect(
            coordinates.latitude == 40.748817,
            "The latitude should equal the expected value."
        )
        #expect(
            coordinates.longitude == -73.985428,
            "The latitude should equal the expected value."
        )
    }

    // MARK: Functions

    /// Tests the `distance()` method.
    ///
    /// This ensures it calculates the correct distance between two locations.
    @Test
    func testDistance() {
        // Given...
        let location1 = MockLocation(latitude: 40.748817, longitude: -73.985428)
        let location2 = MockLocation(latitude: 40.689247, longitude: -74.044502)

        // When...
        let distance = location1.distance(from: location2)

        // Then...
        #expect(
            distance > 0,
            "The distance should be greater than zero."
        )
    }
}
