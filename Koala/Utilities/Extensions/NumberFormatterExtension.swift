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
    func rounded(toPlaces places:Int) -> Double {
            let divisor = pow(10.0, Double(places))
            return (self * divisor).rounded() / divisor
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

//to get average of float array (Double, Float)
extension Array where Element: FloatingPoint {
    
    var sum: Element {
        return reduce(0, +)
    }

    var average: Element {
        guard !isEmpty else {
            return 0
        }
        return sum / Element(count)
    }

}

extension String{
    func dateFormatter(dateBefore: String) -> String {
        let dateFormatterGet = DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatterGet.date(from: dateBefore) ?? Date()
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func formatToDate()->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
 
        return dateFormatter.date(from: self) ?? Date()
    }
}

extension Date{
    func formatToString()->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        return formatter.string(from: self)
    }
}
