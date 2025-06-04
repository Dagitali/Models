//
//  Country.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 An enumeration for specifying a country.

 References:
 1. https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
 2. https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes
*/

import Foundation

// MARK: - Public

/// An enumeration for specifying a country by its country code using the ISO
/// 3166-1 alpha-2 standard.
@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public enum Country: String, CaseIterable, Codable {
    case ad   // Andorra
    case ae   // United Arab Emirates
    case af   // Afghanistan
    case ag   // Antigua and Barbuda
    case ai   // Anguilla
    case al   // Albania
    case am   // Armenia
    case ao   // Angola
    case aq   // Antarctica
    case ar   // Argentina
    case `as` // American Samoa
    case at   // Austria
    case au   // Australia
    case aw   // Aruba
    case ax   // Åland Islands
    case az   // Azerbaijan
    case ba   // Bosnia and Herzegovina
    case bb   // Barbados
    case bd   // Bangladesh
    case be   // Belgium
    case bf   // Burkina Faso
    case bg   // Bulgaria
    case bh   // Bahrain
    case bi   // Burundi
    case bj   // Benin
    case bl   // Saint Barthélemy
    case bm   // Bermuda
    case bn   // Brunei Darussalam
    case bo   // Bolivia, Plurinational State of
    case bq   // Bonaire, Sint Eustatius and Saba
    case br   // Brazil
    case bs   // Bahamas
    case bt   // Bhutan
    case bv   // Bouvet Island
    case bw   // Botswana
    case by   // Belarus
    case bz   // Belize
    case ca   // Canada
    case cc   // Cocos (Keeling) Islands
    case cd   // Congo, the Democratic Republic of the
    case cf   // Central African Republic
    case cg   // Congo
    case ch   // Switzerland
    case ci   // Côte d'Ivoire
    case ck   // Cook Islands
    case cl   // Chile
    case cm   // Cameroon
    case cn   // China
    case co   // Colombia
    case cr   // Costa Rica
    case cu   // Cuba
    case cv   // Cabo Verde
    case cw   // Curaçao"
    case cx   // Christmas Island
    case cy   // Cyprus
    case cz   // Czechia
    case de   // Germany
    case dj   // Djibouti
    case dk   // Denmark
    case dm   // Dominica
    case `do` // Dominican Republic
    case dz   // Algeria
    case ec   // Ecuador
    case ee   // Estonia
    case eg   // Egypt
    case eh   // Western Sahara
    case er   // Eritrea
    case es   // Spain
    case et   // Ethiopia
    case fi   // Finland
    case fj   // Fiji
    case fk   // Falkland Islands (Malvinas)
    case fm   // Micronesia, Federated States of
    case fo   // Faroe Islands
    case fr   // France
    case ga   // Gabon
    case gb   // United Kingdom of Great Britain and Northern Ireland
    case gd   // Grenada
    case ge   // Georgia
    case gf   // French Guiana
    case gg   // Guernsey
    case gh   // Ghana
    case gi   // Gibraltar
    case gl   // Greenland
    case gm   // Gambia
    case gn   // Guinea
    case gp   // Guadeloupe
    case gq   // Equatorial Guinea
    case gr   // Greece
    case gs   // South Georgia and the South Sandwich Islands
    case gt   // Guatemala
    case gu   // Guam
    case gw   // Guinea-Bissau
    case gy   // Guyana
    case hk   // Hong Kong
    case hm   // Heard Island and McDonald Islands
    case hn   // Honduras
    case hr   // Croatia
    case ht   // Haiti
    case hu   // Hungary
    case id   // Indonesia
    case ie   // Ireland
    case il   // Israel
    case im   // Isle of Man
    case `in` // India
    case io   // British Indian Ocean Territory
    case iq   // Iraq
    case `is` // Iceland
    case it   // Italy
    case je   // Jersey
    case jm   // Jamaica
    case jo   // Jordan
    case jp   // Japan
    case ke   // Kenya
    case kg   // Kyrgyzstan
    case kh   // Cambodia
    case ki   // Kiribati
    case km   // Comoros
    case kn   // Saint Kitts and Nevis
    case kp   // Korea, Democratic People's Republic of
    case kr   // Korea, Republic of
    case kw   // Kuwait
    case ky   // Cayman Islands
    case kz   // Kazakhstan
    case la   // Lao People's Democratic Republic
    case lb   // Lebanon
    case lc   // Saint Lucia
    case li   // Liechtenstein
    case lk   // Sri Lanka
    case lr   // Liberia
    case ls   // Lesotho
    case lt   // Lithuania
    case lu   // Luxembourg
    case lv   // Latvia
    case ly   // Libya
    case ma   // Morocco
    case mc   // Monaco
    case md   // Moldova, Republic of
    case me   // Montenegro
    case mf   // Saint Martin (French part)
    case mg   // Madagascar
    case mh   // Marshall Islands
    case mk   // North Macedonia
    case ml   // Mali
    case mm   // Myanmar (Burma)
    case mn   // Mongolia
    case mo   // Macau SAR, China
    case mp   // Northern Mariana Islands
    case mq   // Martinique
    case mr   // Mauritania
    case ms   // Montserrat
    case mu   // Mauritius
    case mv   // Maldives
    case mw   // Malawi
    case mx   // Mexico
    case mz   // Mozambique
    case na   // Namibia
    case nc   // New Caledonia
    case ne   // Niger
    case nf   // Norfolk Island
    case ng   // Nigeria
    case ni   // Nicaragua
    case nl   // Netherlands, Kingdom of the
    case no   // Norway
    case np   // Nepal
    case nr   // Nauru
    case nu   // Niue
    case nz   // New Zealand
    case om   // Oman
    case pa   // Panama
    case pe   // Peru
    case pf   // French Polynesia
    case pg   // Papua New Guinea
    case ph   // Philippines
    case pk   // Pakistan
    case pl   // Poland
    case pm   // Saint Pierre and Miquelon
    case pn   // Pitcairn
    case pr   // Puerto Rico
    case ps   // Palestine, State of
    case pt   // Portugal
    case pw   // Palau
    case py   // Paraguay
    case qa   // Qatar
    case re   // Réunion
    case ro   // Romania
    case rs   // Serbia
    case ru   // Russian Federation
    case rw   // Rwanda
    case sa   // Saudi Arabia
    case sb   // Solomon Islands
    case sc   // Seychelles
    case sd   // Sudan
    case se   // Sweden
    case sg   // Singapore
    case sh   // Saint Helena, Ascension and Tristan da Cunha
    case si   // Slovenia
    case sj   // Svalbard and Jan Mayen
    case sk   // Slovakia
    case sl   // Sierra Leone
    case sm   // San Marino
    case sn   // Senegal
    case so   // Somalia
    case sr   // Suriname
    case ss   // South Sudan
    case st   // São Tomé and Príncipe
    case sv   // El Salvador
    case sx   // Sint Maarten (Dutch part)
    case sy   // Syrian Arab Republic
    case sz   // Eswatini
    case tc   // Turks and Caicos Islands
    case td   // Chad
    case tf   // French Southern Territories
    case tg   // Togo
    case th   // Thailand
    case tj   // Tajikistan
    case tk   // Tokelau
    case tl   // Timor-Leste
    case tm   // Turkmenistan
    case tn   // Tunisia
    case to   // Tonga
    case tr   // Türkiye
    case tt   // Trinidad and Tobago
    case tv   // Tuvalu
    case tw   // Taiwan, Province of China
    case tz   // Tanzania, United Republic of
    case ua   // Ukraine
    case ug   // Uganda
    case um   // United States Minor Outlying Islands
    case us   // United States of America
    case uy   // Uruguay
    case uz   // Uzbekistan
    case va   // Holy See
    case vc   // Saint Vincent and the Grenadines
    case ve   // Venezuela, Bolivarian Republic of
    case vg   // Virgin Islands (British)
    case vi   // Virgin Islands (U.S.)
    case vn   // Viet Nam
    case vu   // Vanuatu
    case wf   // Wallis and Futuna
    case ws   // Samoa
    case ye   // Yemen
    case yt   // Mayotte
    case za   // South Africa
    case zm   // Zambia
    case zw   // Zimbabwe

    // MARK: Initialization

    /// Initializes a `Country` from an ISO code, defaulting to `.us` if the
    /// code is invalid.
    ///
    /// ## Example
    /// ```swift
    /// let country = Country(code: "GB") // United Kingdom
    /// let unknown = Country(code: "ZZ") // Defaults to United States
    /// ```
    ///
    /// - Parameter code: The ISO 3166-1 alpha-2 country code.
    init(code: String) {
        self = Country.from(code: code) ?? .us
    }
}

// MARK: - Public (Computed Properties)

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Country {
    // MARK: Instance Properties

    /// The ISO 3166-1 alpha-2 country code (e.g., `"US"`, `"FR"`).
    ///
    /// ## Example
    /// ```swift
    /// let country = Country.us
    /// print(country.code) // "US"
    /// ```
    var code: String { rawValue.uppercased() }

    /// The localized full name of the country from `Locale`, if available.
    /// Falls back to the raw value if no localized name is found.
    ///
    /// ## Example
    /// ```swift
    /// let country = Country.fr
    /// print(country.name) // "France" (or localized equivalent)
    /// ```
    var name: String {
        Locale.current.localizedString(forRegionCode: self.rawValue) ?? self.rawValue
    }

    // MARK: Static Properties

    /// Returns a list of all available ISO country codes.
    ///
    /// ## Example
    /// ```swift
    /// let countryCodes = Country.codes
    /// print(countryCodes) // ["US", "FR", "DE", ...]
    /// ```
    static var codes: [Locale.Region] {
        Locale.Region.isoRegions
    }

    /// Retrieves the user's preferred country from `UserDefaults`, or defaults
    /// to the system locale.
    ///
    /// ## Example
    /// ```swift
    /// let preferredCountry = Country.preferred
    /// print(preferredCountry) // Country.us (or system's default country)
    /// ```
    static var preferred: Country {
        if let savedCode = UserDefaults.standard.string(forKey: "preferredCountry"),
           let country = Country.from(code: savedCode) {
            return country
        }
        let systemCode = Locale.current.region?.identifier ?? "US"

        return Country.from(code: systemCode) ?? .us
    }
}

// MARK: - Public (Methods)

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *)
public extension Country {
    // MARK: Instance Methods

    /// Saves the current country as the user's preferred country in
    /// `UserDefaults`.
    ///
    /// ## Example
    /// ```swift
    /// Country.us.saveAsPreferred()
    /// ```
    func saveAsPreferred() {
        UserDefaults.standard.set(self.rawValue, forKey: "preferredCountry")
    }

    // MARK: Static Methods

    /// Looks up a `Country` instance from an ISO 3166-1 alpha-2 code.
    ///
    /// The lookup is case-insensitive.
    ///
    /// ## Example
    /// ```swift
    /// let country = Country.fromCode("fr")
    /// print(country?.name) // "France"
    /// ```
    ///
    /// - Parameter code: The ISO 3166-1 alpha-2 country code.
    /// - Returns: A `Country` instance if found, `nil` if not.
    static func from(code: String) -> Country? {
        Country.allCases.first { $0.rawValue.caseInsensitiveCompare(code) == .orderedSame }
    }
}
