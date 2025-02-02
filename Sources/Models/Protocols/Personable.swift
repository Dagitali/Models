//
//  Personable.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A protocol for conforming types to model a person.
*/

import Foundation

// MARK: - Public

/// A protocol for conforming types to model a person.
public protocol Personable {
    // MARK: Computed Properties

    /// The first name of the person.
    var firstName: String { get }

    /// The last name of the person.
    var lastName: String { get }

    /// The full name of the person, combining the first and last names.
    var fullName: String { get }

    /// The date of birth of the person, if available.
    var birthDate: Date? { get }

    // MARK: Functions

    /// Calculates the age of the person as of a given date.
    /// - Parameter date: The date to calculate the age relative to.  Defaults
    ///   to the current date.
    /// - Returns: The age in years, or `nil` if the date of birth is not set.
    func age(asOf date: Date) -> Int?
}

// MARK: - Public (Protocol Defaults)

public extension Personable {
    // MARK: Computed Properties

    var fullName: String {
        "\(firstName) \(lastName)"
    }

    // MARK: Functions

    func age(asOf date: Date = Date()) -> Int? {
        guard let birthDate = birthDate else { return nil }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: birthDate, to: date)

        return components.year
    }
}
