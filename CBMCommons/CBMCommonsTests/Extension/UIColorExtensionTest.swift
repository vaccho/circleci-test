//
//  UIColorExtensionTest.swift
//  CBMCommons
//
//  Created by kazuho on 2016/08/25.
//  Copyright © 2016年 Cybozu, Inc. All rights reserved.
//

import Foundation

import XCTest
@testable import CBMCommons

class UIColorExtensionTest: XCTestCase {
    func test_正常系_alpha指定なし_シャープあり() {
        assertRGBA("#fff000", alpha: nil, expectR: 255, expectG: 240, expectB: 0, expectA: 1.0)
    }

    func test_正常系_alpha指定あり_シャープあり() {
        assertRGBA("#00fff0", alpha: 0.5, expectR: 0, expectG: 255, expectB: 240, expectA: 0.5)
    }

    func test_正常系_alpha指定なし_シャープなし() {
        assertRGBA("fff000", alpha: nil, expectR: 255, expectG: 240, expectB: 0, expectA: 1.0)
    }

    func test_正常系_alpha指定あり_シャープなし() {
        assertRGBA("00fff0", alpha: 0.5, expectR: 0, expectG: 255, expectB: 240, expectA: 0.5)
    }

    func test_正常系_3桁で指定_alpha指定なし_シャープあり() {
        assertRGBA("#000", alpha: nil, expectR: 0, expectG: 0, expectB: 0, expectA: 1.0)
    }

    func test_正常系_3桁で指定_alpha指定あり_シャープあり() {
        assertRGBA("#00f", alpha: 0.5, expectR: 0, expectG: 0, expectB: 255, expectA: 0.5)
    }

    func test_正常系_3桁で指定_alpha指定なし_シャープなし() {
        assertRGBA("0f0", alpha: nil, expectR: 0, expectG: 255, expectB: 0, expectA: 1.0)
    }

    func test_正常系_3桁で指定_alpha指定あり_シャープなし() {
        assertRGBA("f00", alpha: 0.5, expectR: 255, expectG: 0, expectB: 0, expectA: 0.5)
    }

    func test_異常系_不正文字列_alpha指定なし() {
        // 文字列が不正なときは白になる
        assertRGBA("hoge", alpha: nil, expectR: 255, expectG: 255, expectB: 255, expectA: 1.0)
    }

    func test_異常系_不正文字列_alpha指定あり() {
        // 不正なときは alpha は無視される
        assertRGBA("hoge", alpha: 0.5, expectR: 255, expectG: 255, expectB: 255, expectA: 1.0)
    }

    private func assertRGBA(hex: String, alpha: CGFloat?, expectR: CGFloat, expectG: CGFloat, expectB: CGFloat, expectA: CGFloat) {
        let color = alpha != nil ? UIColor.hex(hex, alpha: alpha!) : UIColor.hex(hex)
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)

        XCTAssertEqual(r * 255, expectR)
        XCTAssertEqual(g * 255, expectG)
        XCTAssertEqual(b * 255, expectB)
        XCTAssertEqual(a, expectA)
    }
}