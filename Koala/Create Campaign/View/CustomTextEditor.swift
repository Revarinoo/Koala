//
//  CustomTextEditor.swift
//  Koala
//
//  Created by Sholihatul Richas on 03/11/21.
//

import SwiftUI

import SwiftUI
struct Demo: View {
    var textTitle : String
    var textFieldHeight : CGFloat
    @Binding var product : String
    
    init(textTitle : String, product: Binding<String>, textFieldHeight: CGFloat) {
            self.textTitle = textTitle
            self._product = product
        self.textFieldHeight = textFieldHeight
        }
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            Text(textTitle)
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            ZStack{
                TextEditor(text: $product).padding(.leading, 15)
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(.black)
                    .background(Color.clear)
                    .colorMultiply(Color("lightGray"))

                    .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                    .padding(.bottom, 5)
                    .padding(.top, 5)

                    .frame(height: textFieldHeight)
                TextEditor(text: self.$product)
                          .foregroundColor(self.product == "placeholderString" ? .gray : .primary)
                          .onTapGesture {
                            if self.product == "placeholderString" {
                              self.product = ""
                            }
                          }
            }.background(Color("lightGray"))
                .cornerRadius(10)
        }
        
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        Demo(textTitle: "placeholderString", product:.constant(""), textFieldHeight: 172)
    }
}
