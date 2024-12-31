//
//  Date+Extension.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import Foundation

extension Date {
    func monthToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: self)
    }
    
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
}
