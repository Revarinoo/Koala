//
//  ProfileBasicForm.swift
//  Koala
//
//  Created by Sholihatul Richas on 23/11/21.
//

import SwiftUI

struct ProfileBasicForm: View {
    @State var text = ""
    @State var harga = ""
    @State var province : locationProvince = .aceh
    var body: some View {
        VStack(alignment: .leading, spacing : 18){
            Text("Title")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter your campaign title", text: $text).textFieldStyle(OvalTextFieldStyleForm())
            
            Text("Title")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter your campaign title", text: $text).textFieldStyle(OvalTextFieldStyleForm())
            
            Text("Title")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter your campaign title", text: $text).textFieldStyle(OvalTextFieldStyleForm())
            
            HStack{
                Section{
                    Picker("Number of people", selection: $province) {
                        ForEach(locationProvince.allCases, id: \.self) { value in
                            Text("\(value.rawValue)").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                        }
                    }
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray).accentColor(ThemeColor.primary)
                }.padding(8)
                
                
                
                Spacer()
            }
            .background(Color.white)
            .cornerRadius(10)
            .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
            .padding(.bottom, 5)
            .padding(.top, -5)
            
            Text("Title")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter your campaign title", text: $harga).textFieldStyle(OvalTextFieldStyleForm()).keyboardType(.numberPad)
        }
    }
}

struct ProfileBasicForm_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBasicForm()
    }
}
