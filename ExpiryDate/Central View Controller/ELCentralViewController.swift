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
    let pickerViewHeight = Double(200.0)
    let pickerViewWidth = Double(300.0)
    
    var datePickerView: UIPickerView = UIPickerView()
    
    var selectedExpiryDate = Date()
    
    @IBOutlet var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dateLabel.textColor = UIColor.greyPlaceholderColor()
        createPickerView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func datePickerValueChanged(_ sender: UIDatePicker){
        
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        print("Selected value \(selectedDate)")
    }
}

