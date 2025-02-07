//
//  CountryTests.swift
//  Models
//
//  Copyright © 2025 Dagitali LLC. All rights reserved.
//

/*
 See the LICENSE.txt file for this package’s licensing information.

 Abstract:
 A test suite to validate the functionality of the `Country` enum.
*/

import Foundation
import Testing
@testable import Models

// MARK: - Tests

/// A test suite to validate the functionality of the `Country` enum.
@Suite("Country Tests")
struct CountryTests {
    // MARK: Mocks

    let country = Country.us

    // MARK: Protocol Conformance (CaseIterable) Tests

    /// Tests conformance to the `CaseIterable` protocol.
    ///
    /// This ensures all of the `Country` cases are iterated.
    @Test
    func testAllCases() {
        // Given...
        let expected: [Country] = [
            .ad, .ae, .af, .ag, .ai, .al, .am, .ao, .aq, .ar,
            .as, .at, .au, .aw, .ax, .az, .ba, .bb, .bd, .be,
            .bf, .bg, .bh, .bi, .bj, .bl, .bm, .bn, .bo, .bq,
            .br, .bs, .bt, .bv, .bw, .by, .bz, .ca, .cc, .cd,
            .cf, .cg, .ch, .ci, .ck, .cl, .cm, .cn, .co, .cr,
            .cu, .cv, .cw, .cx, .cy, .cz, .de, .dj, .dk, .dm,
            .do, .dz, .ec, .ee, .eg, .eh, .er, .es, .et, .fi,
            .fj, .fk, .fm, .fo, .fr, .ga, .gb, .gd, .ge, .gf,
            .gg, .gh, .gi, .gl, .gm, .gn, .gp, .gq, .gr, .gs,
            .gt, .gu, .gw, .gy, .hk, .hm, .hn, .hr, .ht, .hu,
            .id, .ie, .il, .im, .in, .io, .iq, .is, .it, .je,
            .jm, .jo, .jp, .ke, .kg, .kh, .ki, .km, .kn, .kp,
            .kr, .kw, .ky, .kz, .la, .lb, .lc, .li, .lk, .lr,
            .ls, .lt, .lu, .lv, .ly, .ma, .mc, .md, .me, .mf,
            .mg, .mh, .mk, .ml, .mm, .mn, .mo, .mp, .mq, .mr,
            .ms, .mu, .mv, .mw, .mx, .mz, .na, .nc, .ne, .nf,
            .ng, .ni, .nl, .no, .np, .nr, .nu, .nz, .om, .pa,
            .pe, .pf, .pg, .ph, .pk, .pl, .pm, .pn, .pr, .ps,
            .pt, .pw, .py, .qa, .re, .ro, .rs, .ru, .rw, .sa,
            .sb, .sc, .sd, .se, .sg, .sh, .si, .sj, .sk, .sl,
            .sm, .sn, .so, .sr, .ss, .st, .sv, .sx, .sy, .sz,
            .tc, .td, .tf, .tg, .th, .tj, .tk, .tl, .tm, .tn,
            .to, .tr, .tt, .tv, .tw, .tz, .ua, .ug, .um, .us,
            .uy, .uz, .va, .vc, .ve, .vg, .vi, .vn, .vu, .wf,
            .ws, .ye, .yt, .za, .zm, .zw
        ]

        // When...
        let actual = Country.allCases

        // Then...
        #expect(
            actual == expected,
            "`Country.allCases` does not contain all expected cases."
        )
    }

    // MARK: Protocol Conformance (Codable) Tests

    /// Tests conformance to the `Codable` protocol.
    ///
    /// This ensures the `Country` is both encodable and decodable.
    @Test
    func testCodable() throws {
        // Given...
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let original = country

        // When...
        let encoded = try encoder.encode(original)
        let decoded = try decoder.decode(Country.self, from: encoded)

        // Then...
        #expect(
            original == decoded,
            "Encoding/decoding failed for `Country`."
        )
    }

    // MARK: Computed Property Tests

    /// Tests the `code` property.
    ///
    /// This ensures the property correctly returns the expected country code.
    @Test
    func testCode() {
        // Given...
        let expected = "US"

        // When...
        let actual = Country.us.code

        // Then...
        #expect(
            actual == expected,
            "The country's code should be \(expected), not \(actual)."
        )
    }

    /// Tests the `name` property.
    ///
    /// This ensures the property correctly returns the expected localized
    /// country name.
    @Test
    func testName() {
        // Given...
        let expected = "United States"

        // When...
        let actual = country.name

        // Then...
        #expect(
            actual == expected,
            "The country's name should be \(expected), not \(actual)."
        )
    }

    // MARK: Static Computed Property Tests

    /// Tests the `codes` property.
    ///
    /// This ensures the property correctly returns all country codes.
    @Test
    func testCodes() {
        // Given...
        let codes = Country.codes
        let expected = 286

        // When...
        let actual = codes.count

        // Then...
        #expect(
            actual == expected,
            "The country code count should be \(expected), not \(actual)."
        )
        #expect(
            codes.contains("US") == true,
            "The country code count should contain US."
        )
    }

    /// Tests the `preferred` property.
    ///
    /// This ensures the property correctly returns the preferred country
    /// codes.
    @Test
    func testPreferred_Default() {
        // Given...
        let systemRegionCode = Locale.current.region?.identifier ?? "US"
        let expected = Country.from(code: systemRegionCode) ?? .us

        // When...
        UserDefaults.standard.removeObject(forKey: "preferredCountry")
        let actual = Country.preferred

        // Then...
        #expect(
            actual == expected,
            "The country code count should be \(expected), not \(actual)."
        )
    }

    /// Tests the `preferred` property.
    ///
    /// This ensures the property correctly returns the preferred country
    /// codes.
    @Test
    func testPreferred_ExistingValue() {
        // Given...
        let expected = Country.us

        // When...
        UserDefaults.standard.removeObject(forKey: "preferredCountry")
        let actual = Country.preferred

        // Then...
        #expect(
            actual == expected,
            "The country code count should be \(expected), not \(actual)."
        )
    }

    // MARK: Initialization Tests

    /// Tests an initializer with respect to case-insensitive `String`
    // represents of country codes.
    ///
    /// This ensures the initializer correctly selects the country for a given
    /// code.
    @Test
    func testInit() {
        // Given...
        let expected = Country.us

        // When...
        let actualUC = Country(code: "US")
        let actualLC = Country(code: "us")
        let actual = Country(code: "XX")

        // Then...
        #expect(
            actualUC == expected,
            "The country code should return \(expected), not \(actualUC)."
        )
        #expect(
            actualLC == expected,
            "The country code should return \(expected), not \(actualLC)."
        )
        #expect(
            actual == expected,
            "The country code should return \(expected), not \(actual)."
        )
    }

    // MARK: Method Tests

    /// Tests the `saveAsPreferred`method.
    ///
    /// This ensures the method correctly saves the country code as the
    /// preferred country.
    @Test
    func testSaveAsPreferred() {
        // Given...
        let expected = country.code.lowercased()

        // When...
        country.saveAsPreferred()
        let actual = UserDefaults.standard.string(forKey: "preferredCountry")

        // Then...
        #expect(
            actual == expected,
            "The preferred country code should be \(expected), not \(actual)."
        )
    }

    /// Tests the `fromCode` method.
    ///
    /// This ensures the method correctly selects the country for a given code.
    @Test
    func testFromCode() {
        // Given...
        let expectedUS = Country.us
        let expectedNil: Country? = nil

        // When...
        let actualUC = Country.from(code: "US")
        let actualLC = Country.from(code: "us")
        let actualNil = Country.from(code: "XX")

        // Then...
        #expect(
            actualUC == expectedUS,
            "The country code should return \(expectedUS), not \(actualUC)."
        )
        #expect(
            actualLC == expectedUS,
            "The country code should return \(expectedUS), not \(actualLC)."
        )
        #expect(
            actualNil == expectedNil,
            "The country code should return \(expectedNil), not \(actualNil)."
        )
    }
}
