//
//  Locatable.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A protocol for conforming types to model a geographical location.
*/

import CoreLocation
import Foundation

// MARK: - Public

/// A protocol for conforming types to model a geographical location.
public protocol Locatable {
    // MARK: Properties

    /// The latitude coordinate of the location.
    var latitude: Double { get }

    /// The longitude coordinate of the location.
    var longitude: Double { get }

    /// Returns the geographic coordinates of the location.
    var coordinates: CLLocationCoordinate2D { get }

    // MARK: Functions

    /// Calculates the distance from this location to another conforming
    /// `Locatable` instance.
    /// - Parameter location: Another `Locatable` instance.
    /// - Returns: The distance in meters.
    func distance(from location: Locatable) -> CLLocationDistance
}

// MARK: - Public (Protocol Defaults)

public extension Locatable {
    // MARK: Computed Properties

    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    // MARK: Functions

    func distance(from location: Locatable) -> CLLocationDistance {
        let currentLocation = CLLocation(
            latitude: latitude,
            longitude: longitude
        )
        let otherLocation = CLLocation(
            latitude: location.latitude,
            longitude: location.longitude
        )

        return currentLocation.distance(from: otherLocation)
    }
}
