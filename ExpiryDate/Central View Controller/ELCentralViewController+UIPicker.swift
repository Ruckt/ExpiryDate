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

    func pickUp(_ textField : UITextField) {
        
        datePickerView.delegate = self
        datePickerView.dataSource = self
        datePickerView.frame = CGRect(x: Double(screenWidth - pickerViewWidth)/2, y: self.screenHeight, width: pickerViewWidth, height: pickerViewHeight)
        datePickerView.backgroundColor = UIColor.white
        
        textField.inputView = datePickerView
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor.white
        toolBar.sizeToFit()
        
        // buttons for toolBar
        let doneButton = UIBarButtonItem(title: "DONE", style: .done, target: self, action: #selector(pickerDoneTapped))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: false)
    
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func pickerDoneTapped() {
        if isSelectedExpiryDateValid() {
            hidePickerView()
        } else {
            self.presentAlert(title: "Validation Error", message: "The selected date cannot be in the past.")
        }
    }
    
    func displayPickerView() {
        UIView.animate(withDuration: 0.75,
                       delay: 0.0,
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        if let pickerWidth = self?.pickerViewWidth,
                            let pickerHeight = self?.pickerViewHeight,
                            let screenWidth = self?.screenWidth,
                            let screenHeight = self?.screenHeight {
                            self?.datePickerView.frame = CGRect(x: Double(screenWidth - pickerWidth)/2, y: screenHeight-pickerHeight, width: pickerWidth, height: pickerHeight)
                        }
                        
        }) { (finished) in }
        self.view.addSubview(datePickerView)
    }

    func hidePickerView() {
        UIView.animate(withDuration: 0.75,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        
                        if let pickerWidth = self?.pickerViewWidth,
                            let pickerHeight = self?.pickerViewHeight,
                            let screenWidth = self?.screenWidth,
                            let screenHeight = self?.screenHeight {
                            self?.datePickerView.frame = CGRect(x: Double(screenWidth - pickerWidth)/2, y: screenHeight, width: pickerWidth, height: pickerHeight)
                            self?.dateTextField.resignFirstResponder()
                        }
        }) { (finished) in
            if finished {
                self.datePickerView.removeFromSuperview()
            }
        }
    }
    
    //MARK: - Data Sources -
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return monthArray.count
        } else {
            return yearsArray.count
        }
    }
    
    //MARK: - Delegates -
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return monthArray[row]
        } else {
            if row == 0 {
                return ""
            } else {
                return yearsArray[row].getYear()
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let month = pickerView.selectedRow(inComponent: 0)
        let pickerYear = pickerView.selectedRow(inComponent: 1)
        
        if (month == 0) || (pickerYear == 0) {
            self.selectedExpiryDate = nil
        } else  {
            let year = Int(yearsArray[pickerYear].getYear())
            let calendar = Calendar(identifier: .gregorian)
            let components = DateComponents(year: year, month: month)
            
            if let selectedDate = calendar.date(from: components) {
                self.selectedExpiryDate = selectedDate
            } else {
                self.selectedExpiryDate = nil
            }
        }
    }
}
