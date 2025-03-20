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
///
/// This protocol provides essential properties and methods for representing a
/// person, including their name, birthdate, and gender.
///
/// ## Example:
/// ```swift
/// struct Person: Personable {
///     var firstName: String
///     var middleName: String?
///     var lastName: String
///     var namePrefix: String?
///     var nameSuffix: String?
///     var nickname: String?
///     var birthDate: Date?
///     var gender: Gender?
/// }
///
/// let person = Person(
///     firstName: "John",
///     middleName: "A.",
///     lastName: "Doe",
///     birthDate: Date(),
///     gender: .male
/// )
/// print(person.fullName) // "John A. Doe"
/// print(person.isAdult)  // true or false based on age
/// ```
@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public protocol Personable {
    // MARK: Stored Properties

    /// The person's first name .
    var firstName: String { get }

    /// The person's middle name, if available.
    var middleName: String? { get }

    /// The person's last name.
    var lastName: String { get }

    /// The name prefix (e.g., "Mr.", "Dr.", "Prof."), if available.
    var namePrefix: String? { get }

    /// The name suffix (e.g., "Jr.", "III"), if available.
    var nameSuffix: String? { get }

    /// The person's commonly used informal name, if available.
    var nickname: String? { get }

    /// The person's date of birth, if available.
    var birthDate: Date? { get }

    // MARK: Computed Properties

    /// The person's birthday.
    var birthday: String { get }

    /// The person's full name, combining the first and last names, including
    /// middle name if available.
    var fullName: String { get }

    /// The person's initials , typically using the first letters of their
    /// names.
    var initials: String { get }

    /// Determines whether the person is considered an adult (18+ years old).
    var isAdult: Bool { get }

    // MARK: Methods

    /// Calculates the age of the person as of a given date.
    /// - Parameter date: The date to calculate the age relative to. Defaults
    ///   to the current date.
    /// - Returns: The age in years, or `nil` if the birth date is not set.
    ///
    /// Example:
    /// ```swift
    /// let age = person.age(asOf: Date())
    /// print(age) // Optional(30)
    /// ```
    func age(asOf date: Date) -> Int?

    /// Returns a formatted birth date in the specified style.
    /// - Parameter style: The desired date format.
    /// - Returns: The formatted birthdate.
    ///
    /// Example:
    /// ```swift
    /// print(person.formattedBirthDate(style: .short)) // "11/23/37"
    /// ```
    func formattedBirthDate(style: DateFormatter.Style) -> String

    /// Returns a formatted name in the specified style.
    /// - Parameter style: The desired name format.
    /// - Returns: The formatted full name.
    ///
    /// Example:
    /// ```swift
    /// print(person.formattedName(style: .lastFirst)) // "Doe, John"
    /// ```
    func formattedName(style: PersonNameComponents.FormatStyle.Style) -> String

    /// Checks if today is the person's birthday.
    /// - Parameter date: The reference date. Defaults to today.
    /// - Returns: `true` if today is the person's birthday, `false` if not.
    func isBirthday(today: Date) -> Bool

    /// Determines the time interval until the person's next birthday.
    /// - Parameter date: The reference date for calculation.
    /// - Returns: The number of seconds until the next birthday, or `nil` if
    ///   the birth date is not set.
    func timeUntilNextBirthday(from date: Date) -> TimeInterval?
}

// MARK: - Public (Protocol Defaults)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Personable {
    // MARK: Computed Properties

    var birthday: String {
        if let birthDate {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("MMMM d")

            return formatter.string(from: birthDate)
        } else {
            return "N/A"
        }
    }

    var fullName: String {
        let name = formattedName()

        return name.isEmpty ? "Unknown Person" : name
    }

    var initials: String {
        let name = formattedName(style: .abbreviated)

        return name.isEmpty ? "N/A" : name
    }

    var isAdult: Bool {
        guard let age = age() else { return false }

        return age >= 18
    }

    // MARK: Methods

    func age(asOf date: Date = Date()) -> Int? {
        guard let birthDate = birthDate else { return nil }

        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: birthDate, to: date)

        return components.year
    }

    func formattedBirthDate(style: DateFormatter.Style = .medium) -> String {
        if let birthDate {
            let formatter = DateFormatter()
            formatter.dateStyle = style

            return formatter.string(from: birthDate)
        } else {
            return "N/A"
        }
    }

    func formattedName(style: PersonNameComponents.FormatStyle.Style = .medium) -> String {
        PersonNameComponents(
            namePrefix: namePrefix,
            givenName: firstName,
            middleName: middleName,
            familyName: lastName,
            nameSuffix: nameSuffix,
            nickname: nickname
        ).formatted(.name(style: style))
    }

    func isBirthday(today: Date = Date()) -> Bool {
        guard let birthDate = birthDate else { return false }

        let calendar = Calendar.current
        let todayComponents = calendar.dateComponents([.month, .day], from: today)
        let birthComponents = calendar.dateComponents([.month, .day], from: birthDate)

        return todayComponents == birthComponents
    }

    func timeUntilNextBirthday(from date: Date) -> TimeInterval? {
        guard let birthDate = birthDate else { return nil }

        let calendar = Calendar.current
        var nextBirthday = calendar.date(bySetting: .year, value: calendar.component(.year, from: date), of: birthDate)!
        if nextBirthday < date {
            nextBirthday = calendar.date(byAdding: .year, value: 1, to: nextBirthday)!
        }

        return nextBirthday.timeIntervalSince(date)
    }
}
