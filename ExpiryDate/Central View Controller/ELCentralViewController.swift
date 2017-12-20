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

    // MARK: Variable and Properties
    
    var screenWidth: Double { return Double(UIScreen.main.bounds.size.width) }
    var screenHeight: Double { return Double(UIScreen.main.bounds.size.height) }
    let pickerViewHeight = Double(170.0)
    let pickerViewWidth = Double(300.0)

    @IBOutlet var dateTextField: UITextField!

    var datePickerView: UIPickerView = UIPickerView()
    
    let monthArray = ["", "1 - JAN", "2- FEB", "3 - MAR", "4 - APR", "5- MAY", "6 - JUN", "7 - JUL", "8- AUG", "9 - SEP", "10 - OV", "11- NOV", "12 - DEC"]
    var yearsArray = [Date()]
    
    var selectedExpiryDate : Date? {
        didSet {
            if let date = self.selectedExpiryDate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/YYYY"
                self.dateTextField.text = dateFormatter.string(from: date)
            } else {
                self.dateTextField.text = ""
            }
        }
    }

    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateTextField.delegate = self
        yearsArray += self.createYearArray()
    }

    // MARK: More Methods
    
    func isSelectedExpiryDateValid() -> Bool {
        
        let today = Date()
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(year: Int(today.getYear()), month: Int(today.getMonthName()))
        
        if let selectedDate = self.selectedExpiryDate,
            let todayMonthYear = calendar.date(from: components),
            selectedDate >= todayMonthYear {
            return true
        } else  {
            return false
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
