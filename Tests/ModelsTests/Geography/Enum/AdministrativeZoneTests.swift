//
//  AdministrativeZoneTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `AdministrativeZone` enum.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Tests

/// A test suite to validate the functionality of the `AdministrativeZone`
/// enum.
@Suite("AdministrativeZone Tests")
struct AdministrativeZoneTest {
    // MARK: Mocks

    let state = AdministrativeZone.state(name: "California", country: .us)
    let territory = AdministrativeZone.territory(name: "Puerto Rico", country: .us)
    let province = AdministrativeZone.province(name: "Ontario", country: .ca)
    let region = AdministrativeZone.region(name: "Île-de-France", country: .fr)
    let department = AdministrativeZone.department(name: "Seine-Maritime", country: .fr)
    let county = AdministrativeZone.county(name: "Los Angeles", country: .us)
    let municipality = AdministrativeZone.municipality(name: "San Francisco", country: .us)
    let unknown = AdministrativeZone.unknown(name: "Unknown", country: .us)

    // MARK: Enum Case Tests

    /// Tests conformance to the `CaseIterable` protocol.
    ///
    /// This ensures all of the `AdministrativeZone` cases correctly initialize
    /// with a name and country.
    @Test
    func testCases() {
        // Given...
        let expectedState = "California"
        let expectedTerritory = "Puerto Rico"
        let expectedProvince = "Ontario"
        let expectedRegion = "Île-de-France"
        let expectedDepartment = "Seine-Maritime"
        let expectedCounty = "Los Angeles"
        let expectedMunicipality = "San Francisco"
        let expectedUnknown = "Unknown"

        // When...
        let actualState = state.name
        let actualTerritory = territory.name
        let actualProvince = province.name
        let actualRegion = region.name
        let actualDepartment = department.name
        let actualCounty = county.name
        let actualMunicipality = municipality.name
        let actualUnknown = unknown.name

        // Then...
        #expect(
            actualState == expectedState,
            "The state's name should be \(expectedState), not \(actualState)."
        )
        #expect(
            actualTerritory == expectedTerritory,
            "The territory's name should be \(expectedTerritory), not \(actualTerritory)."
        )
        #expect(
            actualProvince == expectedProvince,
            "The province's name should be \(expectedProvince), not \(actualProvince)."
        )
        #expect(
            actualRegion == expectedRegion,
            "The region's name should be \(expectedRegion), not \(actualRegion)."
        )
        #expect(
            actualDepartment == expectedDepartment,
            "The department's name should be \(expectedDepartment), not \(actualDepartment)."
        )
        #expect(
            actualCounty == expectedCounty,
            "The county's name should be \(expectedCounty), not \(actualCounty)."
        )
        #expect(
            actualMunicipality == expectedMunicipality,
            "The municipality's name should be \(expectedMunicipality), not \(actualMunicipality)."
        )
        #expect(
            actualUnknown == expectedUnknown,
            "The municipality's name should be \(expectedUnknown), not \(actualUnknown)."
        )
    }

    // MARK: Computed Property Tests

    /// Tests the `country` property.
    ///
    /// This ensures the property correctly returns the expected administrative
    /// zone's country.
    @Test
    func testCountry() {
        // Given...
        let expected = Country.us

        // When...
        let actual = state.country

        // Then...
        #expect(
            actual == expected,
            "The administrative zone's country should be \(expected), not \(actual)."
        )
    }

    /// Tests the `country` property.
    ///
    /// This ensures the property correctly returns the expected administrative
    /// zone's name.
    @Test
    func testName() {
        // Given...
        let expected = "California"

        // When...
        let actual = state.name

        // Then...
        #expect(
            actual == expected,
            "The administrative zone's name should be \(expected), not \(actual)."
        )
    }

    // MARK: Instance Method Tests

    /// Tests the `saveToCache` method.
    ///
    /// This ensures the method correctly saves the administrative zone to the
    /// cache.
    @Test
    func testSaveToCache() {
        // Given...
        let expectedName = "California"
        let expectedCountry = Country.us

        // When...
        state.saveToCache()
        let actual = AdministrativeZone.fromCache(for: .us)

        // Then...
        #expect(
            actual != nil,
            "The cached administrative zone should not be nil."
        )
        #expect(
            actual!.name == expectedName,
            "The administrative zone's name should return \(expectedName), not \(actual!.name)."
        )
        #expect(
            actual!.country == expectedCountry,
            "The administrative zone's name should return \(expectedCountry), not \(actual!.country)."
        )
    }

    // MARK: Static Method Tests

    /// Tests the `from`method.
    ///
    /// This ensures the method correctly returns the expected administrative
    /// zone.
    @Test
    func testFrom() {
        // Given...
        let expected = state.name

        // When...
        let actual = AdministrativeZone.from(name: "California", country: .us).name

        // Then...
        #expect(
            actual == expected,
            "The administrative zone should be \(expected), not \(actual)."
        )
    }

    /// Tests the `fromCache` method.
    ///
    /// This ensures the method correctly returns the cached administrative
    /// zone.
    @Test
    func testFromCache() {
        // Given...
        let expected = "California"

        // When...
        UserDefaults.standard.removeObject(forKey: "zone_US")
        let cachedZone = AdministrativeZone.fromCache(for: .us)
        let actual = cachedZone?.name

        // Then...
        #expect(
            actual == expected,
            "The cached administrative zone should return \(expected), not \(actual)."
        )
    }
}
