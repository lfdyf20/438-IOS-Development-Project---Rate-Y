//
//  customClasses.swift
//  MMB
//
//  Created by Fei Liang on 12/13/16.
//  Copyright © 2016 Fei Liang. All rights reserved.
//

import Foundation
import UIKit

let c1 = UIColor(red: 110/255, green: 210/255, blue: 230/255, alpha: 1)
let c2 = UIColor(red: 169/255, green: 219/255, blue: 216/255, alpha: 1)
let c3 = UIColor(red: 224/255, green: 228/255, blue: 205/255, alpha: 1)
let c4 = UIColor(red: 241/255, green: 134/255, blue: 60/255, alpha: 1)
let c5 = UIColor(red: 248/255, green: 105/255, blue: 32/255, alpha: 1)

class colorDicClass {
    var colorDic: [String:UIColor] = [:]
    init() {
        colorDic["1"] = c1
        colorDic["2"] = c2
        colorDic["3"] = c3
        colorDic["4"] = c4
        colorDic["5"] = c5
    }
}
