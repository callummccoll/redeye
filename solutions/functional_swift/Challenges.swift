//
//  Challenges.swift
//  functional_swift
//
//  Created by Callum McColl on 25/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

import Foundation

// There are four challenges that need to be completed.  The challenges get
// progressively harder.  Some rules to follow:
//
// 1. For challenges 1 - 3, you are not allowed to use any loops.  Higher order
//    functions/recursion only.
//
// 2. For challenges 1 - 3, you are not allowed to use vars, unless you want to
//    append to an array.  So this is legal:
//        ```
//          let arr = [1, 2, 3]
//          var temp: [String] = []
//          arr.forEach { temp.append("\($0)") }
//        ```
//    But try and use functions such as `map`, `filter` and `reduce` first.
//
// 3. There are no rules for Challenge 4, do whatever you want.

// We are making a data visualisation app.  Below is the data that we are going
// to use.  The data represents a list of users and which phones they own.  The
// `Phone` type is an enum.  The raw value of the enum is a String, so if you
// would like to represent the phone as a String you can simply write
// `phone.rawValue`.

let data: [(name: String, phone: Phone)] = [
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

// MARK: - First Challenge: Sorted List
//
// The first challenge is to represent the list of data sorted by the phone and,
// if the phones are the same, by the users name, in ascending order.  So the
// expected output of `sortedList(fromData:)` is:
//
// [
//     ("Chanté Roy", .GalaxyS4),
//     ("Mesut Passerini", .GalaxyS4),
//     ("Zachery Hunt", .GalaxyS4),
//     ("Sindri Spada", .GalaxyS5),
//     ("Faunus Masson", .GalaxyS6),
//     ("Tamara Queen", .GalaxyS6),
//     ("Jaquelyn Hackett", .GalaxyS7),
//     ("Evangelina Carl", .Other),
//     ("Lorena Andreev", .iPhone5),
//     ("Mustafa Raines", .iPhone5),
//     ("Egill Nowell", .iPhone6),
//     ("Fulk Freeman", .iPhone6),
//     ("Nives Klima", .iPhone6),
//     ("Darby Accardo", .iPhone7),
//     ("Egbert Lynton", .iPhone7)
// ]

func sortedList(fromData data: [(name: String, phone: Phone)]) -> [(String, Phone)] {
    return data.sorted {
        if $0.phone == $1.phone {
            return $0.name < $1.name
        }
        return $0.phone.rawValue < $1.phone.rawValue
    }
}

// MARK: - Second Challenge: Grouped Sorted List
//
// For the second challenge you are to create a list that is sorted by the users
// name.  However the list must be divided into sub-arrays based on the first
// character in the users name.  So the expected output of
// `groupedSortedList(fromData:)` is:
// [
//     [
//         ("Chanté Roy", .GalaxyS4),
//     ],
//     [
//         ("Darby Accardo", .iPhone7),
//     ],
//     [
//         ("Egbert Lynton", .iPhone7),
//         ("Egill Nowell", .iPhone6),
//         ("Evangelina Carl", .Other),
//     ],
//     [
//         ("Faunus Masson", .GalaxyS6),
//         ("Fulk Freeman", .iPhone6),
//     ],
//     [
//         ("Jaquelyn Hackett", .GalaxyS7),
//     ],
//     [
//         ("Lorena Andreev", .iPhone5),
//     ],
//     [
//         ("Mesut Passerini", .GalaxyS4),
//         ("Mustafa Raines", .iPhone5),
//     ],
//     [
//         ("Nives Klima", .iPhone6),
//     ],
//     [
//         ("Sindri Spada", .GalaxyS5),
//     ],
//     [
//         ("Tamara Queen", .GalaxyS6),
//     ],
//     [
//         ("Zachery Hunt", .GalaxyS4)
//     ]
// ]

// To make our jobs easier, lets create a new `grouped` higher order function:

extension Array {
    
    /**
     *  Split an array int sub-arrays where each sub-array contains elements
     *  that conform to `shouldGroup`.
     *
     *  In this example, `grouped(by:)` is used to group an `Array` of `Int`s:
     *  ````
     *      let numbers = [1, 1, 2, 2, 3, 4, 1, 1, 5]
     *      let grouped = numbers.grouped { $0 == $1 }
     *          // [[1, 1], [2, 2], [3], [4], [1, 1], [5]]
     *  ````
     *
     *  - Parameter shouldGroup: A function that returns true when two
     *    elements should be grouped together into a sub-array.
     */
    func grouped(by shouldGroup: (Element, Element) -> Bool) -> [[Element]] {
        guard let first = self.first else {
            return []
        }
        var groups: [[Element]] = [[first]]
        let _: Element = self.dropFirst().reduce(first) {
            if false == shouldGroup($0, $1) {
                groups.append([$1])
                return $1
            }
            groups[groups.endIndex - 1].append($1)
            return $1
        }
        return groups
    }
    
}

// Allows us to group elements that are `Equatable` using the `==` operator.

extension Array where Element: Equatable {
    
    /**
     *  Split an array int sub-arrays where each sub-array contains elements
     *  that are equal.
     *
     *  In this example, `grouped()` is used to group an `Array` of `Int`s:
     *  ````
     *      let numbers = [1, 1, 2, 2, 3, 4, 1, 1, 5]
     *      let grouped = numbers.grouped()
     *          // [[1, 1], [2, 2], [3], [4], [1, 1], [5]]
     *  ````
     */
    func grouped() -> [[Element]] {
        return self.grouped(by: ==)
    }
    
}

func groupedSortedList(fromData data: [(name: String, phone: Phone)]) -> [[(String, Phone)]] {
    return data.sorted { $0.name < $1.name }.grouped {
        $0.name.characters.first == $1.name.characters.first
    }
}

// MARK: - Third Challenge: Calculate How Many People Own Each Phone.
//
// For the third challenge, you are to calculate how many users own each phone.
// For this challenge, you can ignore phones that are not owned by any users.
// You should return an array that contains tuples, where each tuple contains
// the phone and the number of users that own that phone.  The expected output
// of `numberForEachPhone(fromData:)` is as follows:
//
// [
//     (.GalaxyS4, 3),
//     (.GalaxyS5, 1),
//     (.GalaxyS6, 2),
//     (.GalaxyS7, 1),
//     (.Other, 1),
//     (.iPhone5, 2),
//     (.iPhone6, 3),
//     (.iPhone7, 2)
// ]

func numberForEachPhone(fromData data: [(name: String, phone: Phone)]) -> [(Phone, Int)] {
    return data.sorted { $0.phone.rawValue < $1.phone.rawValue }.grouped { $0.phone == $1.phone }.flatMap {
        guard let first = $0.first else {
            return nil
        }
        return (first.phone, $0.count)
    }
}

// MARK: - Fourth Challenge: Make a Lazy Version of Challenge 2.
//
// Make sure you add Challenge4Tests.swift to the test target.
//
// In Challenge 2, you created an implementation of the `grouped` higher order
// function.  For this challenge you are to do the same however you must
// create a lazy implementation.
//
// Therefore if you were to sort an `Array` of `Int`s:
// ````
//     let numbers = [1, 1, 2, 2, 3, 4, 1, 1, 5]
//     let grouped = numbers.grouped()
//         // [[1, 1], [2, 2], [3], [4], [1, 1], [5]]
// ````
//
// you would not actually perform the grouping until the values within the new
// collection are used.  For this you must create your own lazy sequence type.
// So `grouped` should return a new `GroupedSequence` type, which implements
// the grouping lazily:
// ````
//     let numbers = [1, 1, 2, 2, 3, 4, 1, 1, 5]
//     let grouped = numbers.lazy.grouped()
//         // GroupedSequence<Array<Int>> - elements are not grouped until they are fetched.
//     let first = grouped.first // Now we perform the grouping required to fetch the first element.
// ````
//
// Hint: you may want to look at how other higher order functions are
// implemented lazily.  Here is how `filter` is implemented:
// 
// https://github.com/apple/swift/blob/42c150cfb75e564f1ac7e58a1b1937ad5f5515ed/stdlib/public/core/Filter.swift.gyb
//
//
// Also take a look at some important protocols:
//
// http://swiftdoc.org/v3.1/protocol/Sequence/
// http://swiftdoc.org/v3.1/protocol/IteratorProtocol/
// http://swiftdoc.org/v3.1/protocol/LazySequenceProtocol/

// To add the lazy grouped functionality to all lazy collections we create an
// extension on `LazySequenceProtocol`:

/*
extension LazySequenceProtocol {
    
    func grouped(by shouldGroup: @escaping (Self.Iterator.Element, Self.Iterator.Element) -> Bool) -> GroupedSequence<Self> {
        return GroupedSequence(self, shouldGroup)
    }
    
}

extension LazySequenceProtocol where Self.Iterator.Element: Equatable {
    
    func grouped() -> GroupedSequence<Self> {
        return GroupedSequence(self, ==)
    }
    
}
*/

extension LazySequenceProtocol {
    
    func grouped(by shouldGroup: @escaping (Self.Iterator.Element, Self.Iterator.Element) -> Bool) -> GroupedSequence<Self> {
        return GroupedSequence(self, shouldGroup)
    }
    
}

extension LazySequenceProtocol where Self.Iterator.Element: Equatable {
    
    func grouped() -> GroupedSequence<Self> {
        return GroupedSequence(self, ==)
    }
    
}

struct GroupedSequence<Base: Sequence>: Sequence, LazySequenceProtocol {
    
    let base: Base
    let shouldGroup: (Base.Iterator.Element, Base.Iterator.Element) -> Bool
    
    init(_ base: Base, _ shouldGroup: @escaping (Base.Iterator.Element, Base.Iterator.Element) -> Bool) {
        self.base = base
        self.shouldGroup = shouldGroup
    }
    
    func makeIterator() -> GroupedSequenceIterator<Base.Iterator> {
        return GroupedSequenceIterator(self.base.makeIterator(), self.shouldGroup)
    }
    
}

struct GroupedSequenceIterator<Base: IteratorProtocol>: IteratorProtocol {
    
    var base: Base
    let shouldGroup: (Base.Element, Base.Element) -> Bool
    
    fileprivate var lastElement: Base.Element? = nil
    
    init(_ base: Base, _ shouldGroup: @escaping (Base.Element, Base.Element) -> Bool) {
        self.base = base
        self.shouldGroup = shouldGroup
    }
    
    mutating func next() -> [Base.Element]? {
        var arr: [Base.Element] = []
        if let last = self.lastElement {
            arr = [last]
        }
        while let element = self.base.next() {
            guard
                let last = self.lastElement,
                false == shouldGroup(last, element)
            else {
                self.lastElement = element
                arr.append(element)
                continue
            }
            self.lastElement = element
            return arr
        }
        self.lastElement = nil
        return arr.isEmpty ? nil : arr
    }
    
}

func lazyGroupedSortedList(fromData data: [(name: String, phone: Phone)]) -> GroupedSequence<LazyRandomAccessCollection<Array<(name: String, phone: Phone)>>> {
    return data.sorted() { $0.name < $1.name }.lazy.grouped {
        $0.name.characters.first == $1.name.characters.first
    }
}
