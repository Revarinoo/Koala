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
    @Binding var updateProfileModel : UpdateProfileModel
    
    var body: some View {
        VStack(spacing: 18){
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram Post Price")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    TextField("Rp ", text: $updateProfileModel.postMin).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.decimalPad)
                    Spacer()
                    Text("-")
                    Spacer()
                    TextField("Rp ", text: $updateProfileModel.postMax).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.decimalPad)
                }
                
            }
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram Story Price")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    TextField("Rp ", text: $updateProfileModel.storyMin).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.decimalPad)
                    Spacer()
                    Text("-")
                    Spacer()
                    TextField("Rp ", text: $updateProfileModel.storyMax).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.decimalPad)
                }
                
            }
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram Reels Price")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    TextField("Rp ", text: $updateProfileModel.reelsMin).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.decimalPad)
                    Spacer()
                    Text("-")
                    Spacer()
                    TextField("Rp ", text: $updateProfileModel.reelsMax).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.decimalPad)
                }
            }
        }
    }
}

struct PriceForm_Previews: PreviewProvider {
    static var previews: some View {
        PriceForm(updateProfileModel: .constant(UpdateProfileModel()))
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
