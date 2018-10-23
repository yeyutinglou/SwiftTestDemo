//
//  TemperatureRange.swift
//  Clock
//
//  Created by jyd on 2018/10/18.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class TemperatureRange: NSObject, UIPickerViewDataSource {

    let values = (-100...100).map { $0 }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
}
