//
//  AgeBracket.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 An enumeration for specifying a person's age bracket.
*/

import Foundation

// MARK: - Public

/// An enumeration for specifying a person's age bracket.
@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public enum AgeBracket: String, CaseIterable, Codable {

    // MARK: Centers for Disease Control (CDC)
    case infantCDC, toddlerCDC, preschoolerCDC, childCDC, teenagerCDC
    case youngAdultCDC, adultCDC, middleAgedCDC, seniorCDC

    // MARK: U.S. Census
    case infantCensus, toddlerCensus, childCensus, youthCensus
    case youngAdultCensus, middleAgedCensus, seniorCensus, seniorMiddleOldCensus, seniorOldestOldCensus

    // MARK: World Health Organization (WHO)
    case infantWHO, earlyChildhoodWHO, childhoodWHO, adolescentWHO
    case youngAdultWHO, middleAgedWHO, seniorWHO

    /// Organization types for age classification.
    enum Organization { case cdc, who, census }
}

// MARK: - Publc (Computed Properties)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension AgeBracket {
    /// Returns a human-friendly name for the age bracket.
    var name: String {
        switch self {
        case .infantCDC, .infantWHO, .infantCensus: return "Infant"
        case .toddlerCDC, .toddlerCensus: return "Toddler"
        case .preschoolerCDC: return "Preschooler"
        case .childCDC, .childhoodWHO, .childCensus: return "Child"
        case .teenagerCDC, .adolescentWHO: return "Teenager / Adolescent"
        case .youngAdultCDC, .youngAdultWHO, .youngAdultCensus: return "Young Adult"
        case .adultCDC: return "Adult"
        case .middleAgedCDC, .middleAgedWHO, .middleAgedCensus: return "Middle Aged"
        case .seniorCDC, .seniorWHO, .seniorCensus: return "Senior"
        case .seniorMiddleOldCensus: return "Middle Old (Senior)"
        case .seniorOldestOldCensus: return "Oldest Old (Senior)"
        case .earlyChildhoodWHO: return "Early Childhood"
        case .youthCensus: return "Youth"
        }
    }

    /// Returns the official age range for this bracket.
    var description: String {
        switch self {
        case .infantCDC: return "0-1 years"
        case .toddlerCDC: return "1-3 years"
        case .preschoolerCDC: return "3-5 years"
        case .childCDC: return "6-11 years"
        case .teenagerCDC: return "12-17 years"
        case .youngAdultCDC: return "18-24 years"
        case .adultCDC: return "25-44 years"
        case .middleAgedCDC: return "45-64 years"
        case .seniorCDC: return "65+ years"

        case .infantWHO: return "0-1 years"
        case .earlyChildhoodWHO: return "1-4 years"
        case .childhoodWHO: return "5-9 years"
        case .adolescentWHO: return "10-19 years"
        case .youngAdultWHO: return "20-39 years"
        case .middleAgedWHO: return "40-64 years"
        case .seniorWHO: return "65+ years"

        case .infantCensus: return "0-4 years"
        case .toddlerCensus: return "1-3 years"
        case .childCensus: return "5-14 years"
        case .youthCensus: return "15-24 years"
        case .youngAdultCensus: return "25-34 years"
        case .middleAgedCensus: return "35-64 years"
        case .seniorCensus: return "65-74 years"
        case .seniorMiddleOldCensus: return "75-84 years"
        case .seniorOldestOldCensus: return "85+ years"
        }
    }

    /// Indicates whether the age bracket is categorized as adult.
    var isAdult: Bool {
        switch self {
        case .youngAdultCDC, .adultCDC, .middleAgedCDC, .seniorCDC:
            return true
        case .youngAdultWHO, .middleAgedWHO, .seniorWHO:
            return true
        case .youngAdultCensus, .middleAgedCensus, .seniorCensus, .seniorMiddleOldCensus, .seniorOldestOldCensus:
            return true
        default:
            return false
        }
    }
}

// MARK: - Public (Functions)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
extension AgeBracket {
    /// Determines the `AgeBracket` for a given age based on the specified
    /// organization.
    ///
    /// - Parameters:
    ///   - age: The age as a numeric type (`Int`, `Float`, `Double`, etc.).
    ///   - organization: The organization whose age brackets to use. Defaults
    ///     to `.cdc`.
    /// - Returns: The corresponding `AgeBracket`.
    ///
    /// ## Example:
    /// ```swift
    /// let bracket = AgeBracket.from(age: 30, organization: .cdc)
    /// print(bracket.name)        // "Adult"
    /// print(bracket.ageRange)    // "25-44 years"
    /// print(bracket.isAdult)     // true
    /// ```
    static func from<T: Numeric & Comparable>(
        age: T,
        organization: Organization = .cdc
    ) -> AgeBracket {
        // Convert to `Double` safely.
        let ageValue = Double("\(age)") ?? 0.0

        switch organization {
        case .cdc:
            switch ageValue {
            case ..<1: return .infantCDC
            case 1..<3: return .toddlerCDC
            case 3..<6: return .preschoolerCDC
            case 6..<12: return .childCDC
            case 12..<18: return .teenagerCDC
            case 18..<25: return .youngAdultCDC
            case 25..<45: return .adultCDC
            case 45..<65: return .middleAgedCDC
            default: return .seniorCDC
            }

        case .who:
            switch ageValue {
            case ..<1: return .infantWHO
            case 1..<5: return .earlyChildhoodWHO
            case 5..<10: return .childhoodWHO
            case 10..<20: return .adolescentWHO
            case 20..<40: return .youngAdultWHO
            case 40..<65: return .middleAgedWHO
            default: return .seniorWHO
            }

        case .census:
            switch ageValue {
            case ..<5: return .infantCensus
            case 5..<15: return .childCensus
            case 15..<25: return .youthCensus
            case 25..<35: return .youngAdultCensus
            case 35..<65: return .middleAgedCensus
            case 65..<75: return .seniorCensus
            case 75..<85: return .seniorMiddleOldCensus
            default: return .seniorOldestOldCensus
            }
        }
    }
}
