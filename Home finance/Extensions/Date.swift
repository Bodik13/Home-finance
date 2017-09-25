//
//  Date.swift
//  Home finance
//
//  Created by Богдан Гуцул on 9/25/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import Foundation

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: self)
        return result
    }
}
