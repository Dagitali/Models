//
//  Gender.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 An enumeration for specifying a person's gender.
*/

import Foundation

// MARK: - Public

/// An enumeration for specifying a person's gender.
public enum Gender: String, CaseIterable, Codable {
    /// Represents a female gender identity.
    case female

    /// Represents a male gender identity.
    case male

    /// Represents a non-binary gender identity.
    case nonBinary

    /// Represents an unspecified or undisclosed gender identity.
    case unspecified
}

// MARK: - Public (Computed Properties)

public extension Gender {
    /// Returns the gender's human-readable name.
    var name: String {
        switch self {
        case .nonBinary: "Non-binary"
        case .unspecified: "Unspecified"
        default: rawValue.localizedCapitalized
        }
    }

    /// Indicates whether the gender is categorized as female.
    var isFemale: Bool {
        self == .female
    }

    /// Indicates whether the gender is categorized as male.
    var isMale: Bool {
        self == .male
    }

    /// Indicates whether the gender is categorized as non-binary or falls
    /// outside the traditional male/female binary.
    var isNonBinary: Bool {
        self == .nonBinary
    }

    /// Indicates whether the gender is categorized as unspecified.
    var isUnspecified: Bool {
        self == .unspecified
    }
}
