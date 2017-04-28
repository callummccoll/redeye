//
//  Challenge1Tests.swift
//  functional_swift
//
//  Created by Callum McColl on 25/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

import XCTest
@testable import functional_swift

class Challenge1Tests: XCTestCase {
    
    let testData: [(name: String, phone: Phone)] = [
        ("Jaquelyn Hackett", .GalaxyS7),
        ("Zachery Hunt", .GalaxyS4),
        ("Evangelina Carl", .Other),
        ("Chanté Roy", .GalaxyS4),
        ("Egbert Lynton", .iPhone7),
        ("Fulk Freeman", .iPhone6),
        ("Lorena Andreev", .iPhone5),
        ("Egill Nowell", .iPhone6),
        ("Darby Accardo", .iPhone7),
        ("Faunus Masson", .GalaxyS6),
        ("Nives Klima", .iPhone6),
        ("Mesut Passerini", .GalaxyS4),
        ("Tamara Queen", .GalaxyS6),
        ("Mustafa Raines", .iPhone5),
        ("Sindri Spada", .GalaxyS5)
    ]
    
    func testSortedList() {
        let result = sortedList(fromData: self.testData)
        let expected: [(String, Phone)] = [
            ("Chanté Roy", .GalaxyS4),
            ("Mesut Passerini", .GalaxyS4),
            ("Zachery Hunt", .GalaxyS4),
            ("Sindri Spada", .GalaxyS5),
            ("Faunus Masson", .GalaxyS6),
            ("Tamara Queen", .GalaxyS6),
            ("Jaquelyn Hackett", .GalaxyS7),
            ("Evangelina Carl", .Other),
            ("Lorena Andreev", .iPhone5),
            ("Mustafa Raines", .iPhone5),
            ("Egill Nowell", .iPhone6),
            ("Fulk Freeman", .iPhone6),
            ("Nives Klima", .iPhone6),
            ("Darby Accardo", .iPhone7),
            ("Egbert Lynton", .iPhone7)
        ]
        XCTAssertTrue(result == expected)
    }
    
    func testSortedListWithEmptyList() {
        let result = sortedList(fromData: [])
        XCTAssertTrue(result.isEmpty)
    }
    
}
