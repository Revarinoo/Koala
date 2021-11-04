//
//  CreateCampaignForm.swift
//  Koala
//
//  Created by Sholihatul Richas on 03/11/21.
//

import SwiftUI

struct CreateCampaignForm: View {
    @State var campaignTitle : String = ""
    @State var dueDate : String = ""
    @State var product : String = ""
    @State var description : String = ""
    @State var rules : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            VStack(alignment: .leading, spacing: 6){
                Text("Email")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your campaign title", text: $campaignTitle).textFieldStyle(OvalTextFieldStyle())
            }
            VStack(alignment: .leading, spacing: 6){
                Text("Due Date")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("dd/mm/yy", text: $dueDate).textFieldStyle(OvalTextFieldStyle())
            }
            VStack(alignment: .leading, spacing: 6){
                Text("Product")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextEditor(text: $product)
                    .colorMultiply(ThemeColor.background).frame(height: 63).cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 6){
                Text("Product")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextEditor(text: $description)
                    .colorMultiply(ThemeColor.background).frame(height: 172).cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 6){
                Text("Product")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextEditor(text: $rules)
                    .colorMultiply(ThemeColor.background).frame(height: 172).cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 6){
                Text("References")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack(spacing: 12){
                    Image(systemName: "photo").font(.system(size: 24)).foregroundColor(.gray)
                        .scaledToFill()
                        .frame(width: 82, height: 88)
                        .background(ThemeColor.background)
                        .cornerRadius(10.0)
                    Image(systemName: "plus").font(.system(size: 24)).foregroundColor(.gray)
                        .scaledToFill()
                        .frame(width: 82, height: 88)
                        .background(ThemeColor.background)
                        .cornerRadius(10.0)
                }
            }
        }.padding([.leading, .trailing], 16).ignoresSafeArea()
            .background(Color.white.ignoresSafeArea())
    }
}

struct CreateCampaignForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateCampaignForm()//.preferredColorScheme(.dark)
    }
}
