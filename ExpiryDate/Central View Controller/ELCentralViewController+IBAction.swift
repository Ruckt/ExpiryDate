//
//  ELCentralViewController+IBAction.swift
//  ExpiryDate
//
//  Created by Edan Lichtenstein on 12/17/17.
//  Copyright © 2017 Ruckt. All rights reserved.
//

import Foundation
import UIKit

extension ELCentralViewController {
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        if dateLabel.text == "required" {
            let alert = UIAlertController(title: "Validation Error", message: "The specified date is not valid.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func dateLabelTapped(_ sender: UITapGestureRecognizer) {
        displayPickerView()
    }

}
