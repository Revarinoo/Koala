//
//  TextArea.swift
//  Koala
//
//  Created by Sholihatul Richas on 05/11/21.
//

import SwiftUI

struct TextArea: View {
    //@State var text = ""
    var placeHolderText : String
    var textTitle : String
    var textFieldHeight : CGFloat
    let fieldBackgroundColor : Color
    @Binding var product : String
    
    init(textTitle : String, product: Binding<String>, textFieldHeight: CGFloat, placeHolderText: String, fieldBackgroundColor: Color) {
        UITextView.appearance().backgroundColor = .clear
        self.textTitle = textTitle
        self._product = product
        self.textFieldHeight = textFieldHeight
        self.placeHolderText = placeHolderText
        self.fieldBackgroundColor = fieldBackgroundColor
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
            Text(textTitle)
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(fieldBackgroundColor)
                
                if product.isEmpty {
                    Text(placeHolderText)
                        .foregroundColor(Color(UIColor.placeholderText))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                }
                
                TextEditor(text: $product)
                    .padding(4)
                
            }
            .frame(height: textFieldHeight)
            .cornerRadius(10)
            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
        }
    }
}

struct TextFieldCustom: View {
    //@State var text = ""
    var placeHolderText : String
    var textTitle : String
    var textFieldHeight : CGFloat
    let fieldBackgroundColor : Color
    @Binding var product : String
    
    init(textTitle : String, product: Binding<String>, textFieldHeight: CGFloat, placeHolderText: String, fieldBackgroundColor: Color) {
        UITextView.appearance().backgroundColor = .clear
        self.textTitle = textTitle
        self._product = product
        self.textFieldHeight = textFieldHeight
        self.placeHolderText = placeHolderText
        self.fieldBackgroundColor = fieldBackgroundColor
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
            Text(textTitle)
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(fieldBackgroundColor)
                
                TextField("Enter your campaign title", text: $product)
                    .padding(4)
                
            }
            .frame(height: textFieldHeight)
            .cornerRadius(10)
            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
        }
    }
}

struct TxtArea: PreviewProvider {
    static var previews: some View {
        TextArea(textTitle: "Product", product:.constant(""), textFieldHeight: 172, placeHolderText: "Input your product description", fieldBackgroundColor: ThemeColor.background)
    }
}
