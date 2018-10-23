//
//  UnitConverter.swift
//  Clock
//
//  Created by jyd on 2018/10/18.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class UnitConverter: NSObject {
    func degressFahrenheit(_ degressCelsius: Int) -> Int {
        return Int(1.8 * Float(degressCelsius) + 32.0)
    }

}
