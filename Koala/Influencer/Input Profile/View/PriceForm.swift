//
//  SwiftUIView.swift
//  Koala
//
//  Created by Sholihatul Richas on 24/11/21.
//

import SwiftUI

struct PriceForm: View {
    
    @State var lowPrice = ""
    @State var highPrice = ""
//    @ObservedObject var input = NumbersOnly()
    
    var body: some View {
        VStack(spacing: 18){
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram Post Price")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    TextField("Rp ", text: $lowPrice).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.numberPad)
                    Spacer()
                    Text("-")
                    Spacer()
                    TextField("Rp ", text: $highPrice).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.numberPad)
                }
                
            }
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram Story Price")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    TextField("Rp ", text: $lowPrice).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.numberPad)
                    Spacer()
                    Text("-")
                    Spacer()
                    TextField("Rp ", text: $highPrice).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.numberPad)
                }
                
            }
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram Reels Price")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    TextField("Rp ", text: $lowPrice).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.numberPad)
                    Spacer()
                    Text("-")
                    Spacer()
                    TextField("Rp ", text: $highPrice).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.numberPad)
                }
                
            }
        }
    }
}

struct PriceForm_Previews: PreviewProvider {
    static var previews: some View {
        PriceForm()
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
