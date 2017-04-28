//
//  Challenge4Tests.swift
//  functional_swift
//
//  Created by Callum McColl on 28/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

import XCTest
@testable import functional_swift

class Challenge4Tests: XCTestCase {
    
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
    
    let expectedData: [[(String, Phone)]] = [
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
    
    var bigTestData: [(String, Phone)] {
        let count = 10000
        let data = self.testData
        if true == data.isEmpty {
            return []
        }
        return Array(AnySequence { () -> AnyIterator<(String, Phone)> in
            var i = 0
            return AnyIterator { () -> (String, Phone)? in
                if i > (data.count * count) {
                    return nil
                }
                let j = i
                i += 1
                return data[j % data.count]
            }
        })
    }
    
    func testLazyGroupedSortedListReturnsCorrectValues() {
        let result = Array(lazyGroupedSortedList(fromData: self.testData))
        XCTAssertTrue(result == self.expectedData)
    }
    
    func testGroupedSortedListReturnsCorrectValues() {
        let result = groupedSortedList(fromData: self.testData)
        XCTAssertTrue(result == self.expectedData)
    }
    
    func testLazyGroupedSortedListWithOneElement() {
        let element: (String, Phone) = ("Name", .None)
        let result = Array(lazyGroupedSortedList(fromData: [element]))
        let expected = [[element]]
        XCTAssertTrue(result == expected)
    }
    
    func testGroupedSortedListWithOneElement() {
        let element: (String, Phone) = ("Name", .None)
        let result = groupedSortedList(fromData: [element])
        let expected = [[element]]
        XCTAssertTrue(result == expected)
    }
    
    func testLazyGroupedSortedListWithEmptyList() {
        let result = Array(lazyGroupedSortedList(fromData: []))
        XCTAssertTrue(result.isEmpty)
    }
    
    func testGroupedSortedListWithEmptyList() {
        let result = groupedSortedList(fromData: [])
        XCTAssertTrue(result.isEmpty)
    }
    
    func testLazyGroupedWithInts() {
        let list = [1, 1, 2, 2, 3, 4, 1, 1, 5, 5]
        let result: [[Int]] = Array(list.lazy.grouped())
        let expected: [[Int]] = [[1, 1], [2, 2], [3], [4], [1, 1], [5, 5]]
        XCTAssertEqual(result.count, expected.count)
        XCTAssertTrue(zip(result, expected).lazy.filter { $0 != $1 }.first == nil)
    }
    
    func testGroupedWithInts() {
        let list = [1, 1, 2, 2, 3, 4, 1, 1, 5, 5]
        let result: [[Int]] = list.grouped()
        let expected: [[Int]] = [[1, 1], [2, 2], [3], [4], [1, 1], [5, 5]]
        XCTAssertEqual(result.count, expected.count)
        XCTAssertTrue(zip(result, expected).lazy.filter { $0 != $1 }.first == nil)
    }
    
    func testLazyGroupedSortedListPerformace() {
        let data = self.bigTestData
        self.measure {
            let _ = lazyGroupedSortedList(fromData: data)
        }
    }
    
    func testGroupedSortedListPerformace() {
        let data = self.bigTestData
        self.measure {
            let _ = groupedSortedList(fromData: data)
        }
    }
    
}
