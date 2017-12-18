//
//  ELCentralViewController+UIPicker.swift
//  ExpiryDate
//
//  Created by Edan Lichtenstein on 12/17/17.
//  Copyright © 2017 Ruckt. All rights reserved.
//

import Foundation
import UIKit

extension ELCentralViewController: UIPickerViewDataSource, UIPickerViewDelegate {


    func createPickerView() {
        
        datePickerView.delegate = self
        datePickerView.dataSource = self
        
        datePickerView.frame = CGRect(x: Double(screenWidth - pickerViewWidth)/2, y: self.screenHeight, width: pickerViewWidth, height: pickerViewHeight)
        //datePickerView.timeZone = NSTimeZone.local
        datePickerView.backgroundColor = UIColor.white
        //datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    func displayPickerView() {
        
        UIView.animate(withDuration: 0.75,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: { [weak self] in
                        if let pickerWidth = self?.pickerViewWidth,
                            let pickerHeight = self?.pickerViewHeight,
                            let screenWidth = self?.screenWidth,
                            let screenHeight = self?.screenHeight {
                            self?.datePickerView.frame = CGRect(x: Double(screenWidth - pickerWidth)/2, y: screenHeight-pickerHeight, width: pickerWidth, height: pickerHeight)
                        }
                        
        }) { (finished) in
            print("Finished")
        }
        self.view.addSubview(datePickerView)
    }
 
    //MARK: - Delegates and data sources
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    //MARK: Delegates
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
   
        return "edan" //picker_values[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        print("Hello")
    }
}
