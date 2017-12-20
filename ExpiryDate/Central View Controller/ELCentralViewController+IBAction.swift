//
//  ELCentralViewController+IBAction.swift
//  ExpiryDate
//
//  Created by Edan Lichtenstein on 12/17/17.
//  Copyright © 2017 Ruckt. All rights reserved.
//

import Foundation
import UIKit

extension ELCentralViewController: UITextFieldDelegate {
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        if self.isSelectedExpiryDateValid() {
            self.presentAlert(title: "Success!", message: "Thank you, the selected date has been saved.")
        } else {
            self.presentAlert(title: "Validation Error", message: "The specified date is not valid.")
        }
    }
    
    @IBAction func dateLabelTapped(_ sender: UITapGestureRecognizer) {
        displayPickerView()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pickUp(dateTextField)
    }

}
