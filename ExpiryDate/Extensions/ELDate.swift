//
//  ELDate.swift
//  ExpiryDate
//
//  Created by Edan Lichtenstein on 12/19/17.
//  Copyright © 2017 Ruckt. All rights reserved.
//

import Foundation

extension Date {
    
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self)
    }
    
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
}
