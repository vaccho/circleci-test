//
//  UIColorExtension.swift
//  CBLibrary
//
//  Created by kazuho on 2016/07/28.
//  Copyright © 2016年 Cybozu, Inc. All rights reserved.
//

import Foundation

extension UIColor {
    public class func hex(hexString: String) -> UIColor {
        return hex(hexString, alpha: 1.0)
    }

    public class func hex (hexString: String, alpha: CGFloat) -> UIColor {
        var hexString = hexString.stringByReplacingOccurrencesOfString("#", withString: "")

        if hexString.characters.count == 3 {
            // abc -> aabbcc に変換
            let startIndex = hexString.startIndex
            let first = hexString[startIndex]
            let second = hexString[startIndex.advancedBy(1)]
            let third = hexString[startIndex.advancedBy(2)]
            hexString = String([first, first, second, second, third, third])
        }

        let scanner = NSScanner(string: hexString)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let red = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            return UIColor.whiteColor();
        }
    }
}