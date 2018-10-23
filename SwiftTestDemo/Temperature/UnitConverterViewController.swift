//
//  UnitConverterViewController.swift
//  Clock
//
//  Created by jyd on 2018/10/18.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class UnitConverterViewController: UIViewController, UIPickerViewDelegate {

    let userDefaultsLastRowKey = "defaultCelsiusPickerRow"
    
    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    fileprivate let converter = UnitConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let row = initialPikerRow()
        celsiusPicker.selectRow(row, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: row, inComponent: 0)
        
    }
    
    func initialPikerRow() -> Int {
        let saveRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int
        if let row = saveRow {
            return row
        } else {
            return celsiusPicker.numberOfRows(inComponent: 0) / 2
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        return "\(celsiusValue)℃"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row)
        saveSeletedRow(row)
    }
    
    func displayConvertedTemperatureForRow(_ row: Int) {
        let degreesCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(converter.degressFahrenheit(degreesCelsius))℉"
    }
    
    func saveSeletedRow(_ row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
        
    }
    

   

}
