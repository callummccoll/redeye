//
//  Challenge2Tests.swift
//  functional_swift
//
//  Created by Callum McColl on 25/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

import XCTest
@testable import functional_swift

class Challenge2Tests: XCTestCase {
    
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
    
    func testGroupedSortedList() {
        let result = groupedSortedList(fromData: self.testData)
        let expected: [[(String, Phone)]] = [
            [
                ("Chanté Roy", .GalaxyS4),
            ],
            [
                ("Darby Accardo", .iPhone7),
            ],
            [
                ("Egbert Lynton", .iPhone7),
                ("Egill Nowell", .iPhone6),
                ("Evangelina Carl", .Other),
            ],
            [
                ("Faunus Masson", .GalaxyS6),
                ("Fulk Freeman", .iPhone6),
            ],
            [
                ("Jaquelyn Hackett", .GalaxyS7),
            ],
            [
                ("Lorena Andreev", .iPhone5),
            ],
            [
                ("Mesut Passerini", .GalaxyS4),
                ("Mustafa Raines", .iPhone5),
            ],
            [
                ("Nives Klima", .iPhone6),
            ],
            [
                ("Sindri Spada", .GalaxyS5),
            ],
            [
                ("Tamara Queen", .GalaxyS6),
            ],
            [
                ("Zachery Hunt", .GalaxyS4)
            ]
        ]
        XCTAssertTrue(result == expected)
    }
    
    func testGroupedSortedListWithOneElement() {
        let element: (String, Phone) = ("Name", .None)
        let result = groupedSortedList(fromData: [element])
        let expected = [[element]]
        XCTAssertTrue(result == expected)
    }
    
    func testGroupedSortedListWithEmptyList() {
        let result = groupedSortedList(fromData: [])
        XCTAssertTrue(result.isEmpty)
    }
    
    func testGroupedWithInts() {
        let list = [1, 1, 2, 2, 3, 4, 1, 1, 5, 5]
        let result: [[Int]] = list.grouped()
        let expected: [[Int]] = [[1, 1], [2, 2], [3], [4], [1, 1], [5, 5]]
        XCTAssertEqual(result.count, expected.count)
        XCTAssertTrue(zip(result, expected).lazy.filter { $0 != $1 }.first == nil)
    }
    
}
