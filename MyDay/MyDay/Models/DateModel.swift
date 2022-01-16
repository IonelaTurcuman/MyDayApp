//
//  DayModel.swift
//  MyDay
//
//  Created by Ionela Turcuman on 10.01.2022.
//

import UIKit

class DateModel {
    
    var year: Int
    var month: String
    var day: Int
    var currentDate: String
    
    init() {
        self.year = 0
        self.month = Constants.DATE_MONTH_DEFAULT
        self.day = 0
        self.currentDate = Constants.DATE_CURRENT_DEFAULT
    }
    
    func parseDate(dateString: String) -> Bool {
        self.year = self.getYear(dateString: dateString)
        self.month = self.getMonth(dateString: dateString)
        self.day = self.getDay(dateString: dateString)
        
        if self.year != 0 && self.month != Constants.DATE_MONTH_DEFAULT && self.day != 0 {
            self.currentDate = String(self.day) + " " + self.month + " " + String(self.year)
            return true
        }
        
        return false
    }
    
    func getYear(dateString: String) -> Int {
        let splitDate = dateString.components(separatedBy: ", ")
        
        if splitDate.count >= 2 {
            let yearInfo = splitDate[2].components(separatedBy: " ")
            
            if yearInfo.count >= 1 {
                guard let intYear = Int(yearInfo[0]) else {
                    return 0
                }
                
                return intYear
            }
        }
        
        return 0
    }
    
    func getMonth(dateString: String) -> String {
        let splitDate = dateString.components(separatedBy: ", ")
        
        if splitDate.count >= 2 {
            let monthDaySplit = splitDate[1].components(separatedBy: " ")
            
            if monthDaySplit.count >= 1 {
                return monthDaySplit[0]
            }
        }
        
        return Constants.DATE_MONTH_DEFAULT
    }
    
    func getDay(dateString: String) -> Int {
        let splitDate = dateString.components(separatedBy: ", ")
        
        if splitDate.count >= 2 {
            let monthDaySplit = splitDate[1].components(separatedBy: " ")
            
            if monthDaySplit.count >= 2 {
                guard let intMonth = Int(monthDaySplit[1]) else {
                    return 0
                }
                
                return intMonth
            }
        }
        
        return 0
    }

}
