//
//  ELCentralViewController.swift
//  ExpiryDate
//
//  Created by Edan Lichtenstein on 12/16/17.
//  Copyright © 2017 Ruckt. All rights reserved.
//

import Foundation
import UIKit

class ELCentralViewController: UIViewController {

    var screenWidth: Double { return Double(UIScreen.main.bounds.size.width) }
    var screenHeight: Double { return Double(UIScreen.main.bounds.size.height) }
    let pickerViewHeight = Double(150.0)
    let pickerViewWidth = Double(300.0)
    
    var datePickerView: UIPickerView = UIPickerView()
    
    
    let monthArray = ["", "1 - JAN", "2- FEB", "3 - MAR", "4 - APR", "5- MAY", "6 - JUN", "7 - JUL", "8- AUG", "9 - SEP", "10 - OV", "11- NOV", "12 - DEC"]
    var yearsArray = [Date()]
    var selectedExpiryDate : Date? {
        didSet {
            if let date = self.selectedExpiryDate {
                print(date)
            }
        }
    }

    @IBOutlet var dateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateTextField.delegate = self
        yearsArray += self.createYearArray()

    }

}


