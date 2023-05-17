//
//  DateExtension.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import Foundation

extension Date {
    var toCustomFormatSTR: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy, HH:mm"
        
        return dateFormatter.string(from: self)
    }
}
