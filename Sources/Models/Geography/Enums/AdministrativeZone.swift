//
//  AdministrativeZone.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 An enumeration representing an administrative zone within a country.
*/

import CoreLocation
import Foundation

// MARK: - Public

/// An enumeration representing an administrative zone within a country.
///
/// Different countries use different terminology for their administrative
/// divisions, such as **states**, **provinces**, **regions**, **departments**,
/// **counties**, and **municipalities**.
///
/// Example:
/// ```swift
/// let zone = AdministrativeZone.state(name: "California", country: .US)
/// print(zone.name) // "California"
/// print(zone.country.name) // "United States"
/// ```
@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public enum AdministrativeZone: Codable {
    case state(name: String, country: Country)
    case territory(name: String, country: Country)
    case province(name: String, country: Country)
    case region(name: String, country: Country)
    case department(name: String, country: Country)
    case county(name: String, country: Country)
    case municipality(name: String, country: Country)
    case unknown(name: String, country: Country)
}

// MARK: - Public (Computed Properties)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension AdministrativeZone {
    // MARK: Instance Properties

    /// The country associated with this administrative zone.
    ///
    /// Example:
    /// ```swift
    /// let zone = AdministrativeZone.state(name: "California", country: .US)
    /// print(zone.country.name) // "United States"
    /// ```
    var country: Country {
        switch self {
        case .state(_, let country),
             .territory(_, let country),
             .province(_, let country),
             .region(_, let country),
             .department(_, let country),
             .county(_, let country),
             .municipality(_, let country),
             .unknown(_, let country):
            return country
        }
    }

    /// The name of the administrative zone (e.g., `"California"`, `"Ontario"`,
    /// `"Île-de-France"`).
    ///
    /// Example:
    /// ```swift
    /// let zone = AdministrativeZone.region(
    ///                name: "Île-de-France",
    ///                country: .FR
    ///            )
    /// print(zone.name) // "Île-de-France"
    /// ```
    var name: String {
        switch self {
        case .state(let name, _),
             .territory(let name, _),
             .province(let name, _),
             .region(let name, _),
             .department(let name, _),
             .county(let name, _),
             .municipality(let name, _),
             .unknown(let name, _):
            return name
        }
    }
}

// MARK: - Public (Methods)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension AdministrativeZone {
    // MARK: Instance Methods

    /// Saves the administrative zone to `UserDefaults` as a cached value.
    ///
    /// Example:
    /// ```swift
    /// let zone = AdministrativeZone.state(name: "California", country: .us)
    /// zone.saveToCache()
    /// ```
    func saveToCache() {
        let key = "zone_\(country.rawValue)"
        UserDefaults.standard.set(name, forKey: key)
    }

    // MARK: Static Methods

    /// Creates an `AdministrativeZone` based on a given region name and
    /// country.
    ///
    /// Example:
    /// ```swift
    /// let zone = AdministrativeZone.from(name: "California", country: .US)
    /// print(zone) // .state(name: "California", country: .US)
    /// ```
    ///
    /// - Parameters:
    ///   - name: The name of the administrative zone.
    ///   - country: The country associated with the zone.
    /// - Returns: The corresponding `AdministrativeZone`.
   static func from(name: String, country: Country) -> AdministrativeZone {
        switch country {
        case .us:
            let usTerritories: Set<String> = [
                "American Samoa", "Guam", "Northern Mariana Islands", "Puerto Rico", "U.S. Virgin Islands"
            ]
            if usTerritories.contains(name) {
                return .territory(name: name, country: country)
            } else {
                return .state(name: name, country: country)
            }
        case .fr:
            let frenchDepartments: Set<String> = [
                "Ain", "Aisne", "Allier", "Alpes-de-Haute-Provence", "Hautes-Alpes", "Alpes-Maritimes",
                "Ardèche", "Ardennes", "Ariège", "Aube", "Aude", "Aveyron",
                "Bouches-du-Rhône", "Calvados", "Cantal", "Charente", "Charente-Maritime",
                "Cher", "Corrèze", "Corse-du-Sud", "Haute-Corse", "Côte-d'Or", "Côtes-d'Armor",
                "Creuse", "Dordogne", "Doubs", "Drôme", "Eure", "Eure-et-Loir", "Finistère",
                "Gard", "Haute-Garonne", "Gers", "Gironde", "Hérault", "Ille-et-Vilaine", "Indre",
                "Indre-et-Loire", "Isère", "Jura", "Landes", "Loir-et-Cher", "Loire",
                "Haute-Loire", "Loire-Atlantique", "Loiret", "Lot", "Lot-et-Garonne", "Lozère",
                "Maine-et-Loire", "Manche", "Marne", "Haute-Marne", "Mayenne", "Meurthe-et-Moselle",
                "Meuse", "Morbihan", "Moselle", "Nièvre", "Nord", "Oise", "Orne", "Pas-de-Calais",
                "Puy-de-Dôme", "Pyrénées-Atlantiques", "Hautes-Pyrénées", "Pyrénées-Orientales",
                "Bas-Rhin", "Haut-Rhin", "Rhône", "Haute-Saône", "Saône-et-Loire", "Sarthe",
                "Savoie", "Haute-Savoie", "Paris", "Seine-Maritime", "Seine-et-Marne",
                "Yvelines", "Deux-Sèvres", "Somme", "Tarn", "Tarn-et-Garonne", "Var",
                "Vaucluse", "Vendée", "Vienne", "Haute-Vienne", "Vosges", "Yonne", "Territoire de Belfort",
                "Essonne", "Hauts-de-Seine", "Seine-Saint-Denis", "Val-de-Marne", "Val-d'Oise"
            ]
            if frenchDepartments.contains(name) {
                return .department(name: name, country: country)
            } else {
                return .region(name: name, country: country)
            }
        case .au, .mx:
            return .state(name: name, country: country)
        case .ca, .cn, .de:
            return .province(name: name, country: country)
        case .it, .jp:
            return .region(name: name, country: country)
        case .gb:
            return .county(name: name, country: country)
        default:
            return .unknown(name: name, country: country)
        }
    }

    /// Retrieves the cached administrative zone from `UserDefaults`, if
    /// available.
    ///
    /// Example:
    /// ```swift
    /// if let cachedZone = AdministrativeZone.fromCache(for: .US) {
    ///     print(cachedZone.name) // "California" (if cached)
    /// }
    /// ```
    ///
    /// - Parameter country: The country for which to retrieve the cached
    ///   administrative zone.
    /// - Returns: The cached `AdministrativeZone`, or `nil` if no cached value
    ///   exists.
    static func fromCache(for country: Country) -> AdministrativeZone? {
        let key = "zone_\(country.rawValue)"
        if let cachedName = UserDefaults.standard.string(forKey: key) {
            return .unknown(name: cachedName, country: country)
        }
        return nil
    }

    /// Dynamically fetches the administrative zone for a given location using
    /// reverse geocoding.
    ///
    /// This method uses `CLGeocoder` to determine the administrative zone from
    /// a `CLLocation` and caches the result.
    ///
    /// Example:
    /// ```swift
    /// let location = CLLocation(latitude: 37.7749, longitude: -122.4194)
    /// AdministrativeZone.get(from: location) { zone in
    ///     if let zone = zone {
    ///         print("Detected Zone: \(zone.name), \(zone.country.name)")
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - location: The `CLLocation` to geocode.
    ///   - completion: A closure that receives the detected
    ///     `AdministrativeZone` or `nil` if unavailable.
    static func get(from location: CLLocation, completion: @escaping (AdministrativeZone?) -> Void) {
        let geocoder = CLGeocoder()

        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first,
                  let countryCode = placemark.isoCountryCode,
                  let country = Country.from(code: countryCode),
                  let adminArea = placemark.administrativeArea else {
                completion(nil)
                return
            }

            let zone = AdministrativeZone.unknown(name: adminArea, country: country)
            zone.saveToCache()
            completion(zone)
        }
    }
}
