//
//  Defaults.swift
//  Home finance
//
//  Created by mac6 on 9/28/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import Foundation
import UIKit

struct Defaults {
    struct Colors {
        static let NAVBAR_BG_COLOR = UIColor.init(hexString: "#DC6900") //#FF6347
        static let INCOME_BTN_BG_COLOR = UIColor.init(hexString: "#20B2AA")
        static let EXPENSE_BTN_BG_COLOR = UIColor.init(hexString: "#F08080")
        static let LIGHT_GREEN_COLOR = UIColor.init(hexString: "#8ed861")
        static let LIGHT_GREY_COLOR = UIColor.init(hexString: "#dddddd")
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
