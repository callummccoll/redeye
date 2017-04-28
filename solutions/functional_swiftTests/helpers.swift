//
//  helpers.swift
//  functional_swift
//
//  Created by Callum McColl on 28/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

func == <S: Sequence, T: Equatable, U: Equatable>(lhs: S, rhs: S) -> Bool where S.Iterator.Element == (T, U) {
    return Array(lhs) == Array(rhs)
}

func != <S: Sequence, T: Equatable, U: Equatable>(lhs: S, rhs: S) -> Bool where S.Iterator.Element == (T, U) {
    return !(lhs == rhs)
}

func == <C: Collection, T: Equatable, U: Equatable>(lhs: C, rhs: C) -> Bool where C.Iterator.Element == (T, U) {
    if lhs.count != rhs.count {
        return false
    }
    let arr = zip(lhs, rhs)
    return arr.lazy.filter { $0 != $1 }.first == nil
}

func != <C: Collection, T: Equatable, U: Equatable>(lhs: C, rhs: C) -> Bool where C.Iterator.Element == (T, U) {
    return !(lhs == rhs)
}

func == <S: Sequence, S2: Sequence, T: Equatable, U: Equatable>(lhs: S, rhs: S) -> Bool where
    S.Iterator.Element == S2,
    S2.Iterator.Element == (T, U)
{
    return Array(lhs) == Array(rhs)
}

func != <S: Sequence, S2: Sequence, T: Equatable, U: Equatable>(lhs: S, rhs: S) -> Bool where
    S.Iterator.Element == S2,
    S2.Iterator.Element == (T, U)
{
    return !(lhs == rhs)
}

func == <C: Collection, C2: Collection, T: Equatable, U: Equatable>(lhs: C, rhs: C) -> Bool where
    C.Iterator.Element == C2,
    C2.Iterator.Element == (T, U)
{
    if lhs.count != rhs.count {
        return false
    }
    let arr = zip(lhs, rhs)
    return arr.lazy.filter { $0 != $1 }.first == nil
}

func != <C: Collection, C2: Collection, T: Equatable, U: Equatable>(lhs: C, rhs: C) -> Bool where
    C.Iterator.Element == C2,
    C2.Iterator.Element == (T, U)
{
    return !(lhs == rhs)
}
