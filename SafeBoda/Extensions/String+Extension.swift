//
//  String+Extension.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

extension String{
    func toDateFormat () -> Date {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZ"
           let date = dateFormatter.date(from: self)
           
           return date ?? Date()
       }
       
       func toShortDate() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZ"
           guard let dateTime = dateFormatter.date(from: self) else { return ""}
           let formatter = DateFormatter()
           formatter.locale = Locale(identifier: "en_US_POSIX")
           formatter.dateFormat = "dd-MM-yy"
           let dateTimeString = formatter.string(from: dateTime)
           
           return dateTimeString
       }
       
       func toMediumDate() -> String {
           if self == "" {
               return "N/A"
           }
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZ"
           guard let dateTime = dateFormatter.date(from: self) else { return ""}
           let formatter = DateFormatter()
           formatter.locale = Locale(identifier: "en_US_POSIX")
           formatter.dateFormat = "dd-MM-yyyy"
           let dateTimeString = formatter.string(from: dateTime)
           
           return dateTimeString
       }
    
    func retunLegalOrNot() -> String {
        let legalCheck = LegalityCheck.init(rawValue: self)
        switch legalCheck {
        case .legal:
            return "Legal"
        case .nonLegal:
            return "Not Legal"
        default:
            return "N/A"
        }
    }
}
