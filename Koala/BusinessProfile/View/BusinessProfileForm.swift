//
//  BusinessProfileForm.swift
//  Koala
//
//  Created by Clara Anggraini on 27/11/21.
//

import Foundation
import SwiftUI

struct BusinessProfileForm: View {
//    @State var province : locationProvince = .defaultValue
    @Binding var inputBusinessProfileModel : InputBusinessProfileModel
    var body: some View {
        VStack(alignment: .leading, spacing : 18){
            VStack(alignment: .leading, spacing: 12){
                Text("Business Name")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your business name", text: $inputBusinessProfileModel.business_name ?? "").textFieldStyle(OvalTextFieldStyleForm())
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Location")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    Section{
                        Picker("Number of people", selection: $inputBusinessProfileModel.location) {
                            ForEach(locationProvince.allCases, id: \.self) { value in
                                Text("\(value.rawValue)").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                            }
                        }
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray).accentColor(inputBusinessProfileModel.location == .defaultValue ? ThemeColor.grayDark : .black)
                    }.padding(8).padding(.leading, 7)
                    Spacer()
                }
                .background(Color("lightGray"))
                .cornerRadius(10)
                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                .padding(.bottom, 5)
                .padding(.top, -5)
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your instagram username (with @)", text: $inputBusinessProfileModel.instagram ?? "").textFieldStyle(OvalTextFieldStyleForm())
            }
            VStack(alignment: .leading, spacing: 12){
                Text("Website")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your website", text: $inputBusinessProfileModel.website ?? "").textFieldStyle(OvalTextFieldStyleForm())
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Description")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                CustomTextEditor.init(placeholder: "Enter your business descriptions.", text: $inputBusinessProfileModel.description ?? "")
                    .background(ThemeColor.grayLight)
                    .frame(height: 152)
                    .cornerRadius(8)
                                
            }
            
        }
    }
}

struct BusinessProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        BusinessProfileForm(inputBusinessProfileModel: .constant(InputBusinessProfileModel()))
    }
}

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
