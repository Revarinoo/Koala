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
