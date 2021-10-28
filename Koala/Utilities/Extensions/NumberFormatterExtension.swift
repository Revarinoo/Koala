//
//  NumberFormatterExtension.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 19/10/21.
//

import Foundation

extension Double {
    var oneDecimalFormatter: String {
        return String(format: "%.1f", self).replacingOccurrences(of: ".", with: ",")
    }
//    var oneDecimalFormatter: String {
//        return String(format: "%.f", self).replacingOccurrences(of: ".", with: ",")
//    }
    func thousandsFormatter() ->String{
        if (self >= 1000000000) {
            return "\((self / 1000000000).oneDecimalFormatter) B";
        }
        if (self >= 1000000) {
            return "\((self / 1000000).oneDecimalFormatter)M";
        }
        if (self >= 1000) {
            return "\(Int(self / 1000))K";
        }
        return String(Int(self))
    }
}

extension Int {
   func rupiahFormatter() -> String {
       let formatter = NumberFormatter()
       formatter.groupingSeparator = "."
       formatter.groupingSize = 3
       formatter.usesGroupingSeparator = true
       return formatter.string(from: NSNumber(value: self))!
   }
}

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        return formatter
    }
}
