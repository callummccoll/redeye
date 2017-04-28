//
//  Phone.swift
//  functional_swift
//
//  Created by Callum McColl on 25/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

enum Phone: String {
    
    case iPhone4 = "iPhone 4"
    case iPhone5 = "iPhone 5"
    case iPhone6 = "iPhone 6"
    case iPhone7 = "iPhone 7"
    case GalaxyS4 = "Galaxy S4"
    case GalaxyS5 = "Galaxy S5"
    case GalaxyS6 = "Galaxy S6"
    case GalaxyS7 = "Galaxy S7"
    case Other = "Other"
    case None = "None"
    
}

extension Phone: CustomStringConvertible {
    
    var description: String {
        return self.rawValue
    }
    
}

extension Phone: Equatable {}

func ==(lhs: Phone, rhs: Phone) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
