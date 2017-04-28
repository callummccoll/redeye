//
//  Challenge3Tests.swift
//  functional_swift
//
//  Created by Callum McColl on 28/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

import XCTest
@testable import functional_swift

class Challenge3Tests: XCTestCase {
    
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
    
    func testNumberForEachPhoneWithTestData() {
        let result = numberForEachPhone(fromData: self.testData)
        let expected: [(Phone, Int)] = [
            (.GalaxyS4, 3),
            (.GalaxyS5, 1),
            (.GalaxyS6, 2),
            (.GalaxyS7, 1),
            (.Other, 1),
            (.iPhone5, 2),
            (.iPhone6, 3),
            (.iPhone7, 2)
        ]
        XCTAssertTrue(result == expected)
    }
    
    func testNumberForEachPhoneWithEmptyList() {
        let result = numberForEachPhone(fromData: [])
        XCTAssertTrue(result.isEmpty)
    }
    
}
