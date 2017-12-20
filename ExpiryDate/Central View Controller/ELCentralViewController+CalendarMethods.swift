//
//  ELCentralViewController+CalendarMethods.swift
//  ExpiryDate
//
//  Created by Edan Lichtenstein on 12/19/17.
//  Copyright © 2017 Ruckt. All rights reserved.
//

import Foundation

extension ELCentralViewController {
    
    func createYearArray() -> [Date] {
    
        var years = [Date]()
        let calendar = Calendar.current
        
        for x in 0 ... 20  {
            if let year = calendar.date(byAdding: .year, value: x, to: Date()) {
                years.append(year)
            }
        }
        return years
    }
}
