//
//  UIColor.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 29/05/21.
//

import Foundation
import UIKit
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

let backGreen = UIColor(hexString: "#A6DABB")
let backOrange = UIColor(hexString: "#F58D37")
let backYellow = UIColor(hexString: "#F4F552")
let backBlue = UIColor(hexString: "#6CCEFE")
let orange2 = UIColor(hexString: "#F0AA6F")
let yellow2 = UIColor(hexString: "#BDBE1C")
let green2 = UIColor(hexString: "#86BB9B")
let blue2 = UIColor(hexString: "#A9D0F4")
let green3 = UIColor(hexString: "#48D0AF")
let orange3 = UIColor(hexString: "#FB6B6C")
let blue3 = UIColor(hexString: "#75BDFE")
let yellow3 = UIColor(hexString: "#FFD86F")
let green4 = UIColor(hexString: "#7CDDC5")
let orange4 = UIColor(hexString: "#EF9395")
let blue4 = UIColor(hexString: "#9CCEFC")
let yellow4 = UIColor(hexString: "#FDE398")
