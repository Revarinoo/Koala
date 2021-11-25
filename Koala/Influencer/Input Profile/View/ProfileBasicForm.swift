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
    @State var province : locationProvince = .defaultValue
    @Binding var updateProfileModel : UpdateProfileModel
    var body: some View {
        VStack(alignment: .leading, spacing : 18){
            VStack(alignment: .leading, spacing: 12){
                Text("Name")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your fullname", text: $updateProfileModel.name).textFieldStyle(OvalTextFieldStyleForm())
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Email")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your email", text: $updateProfileModel.email).textFieldStyle(OvalTextFieldStyleForm())
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Instagram")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your instagram username", text: $updateProfileModel.socialMedia).textFieldStyle(OvalTextFieldStyleForm())
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Location")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                HStack{
                    Section{
                        Picker("Number of people", selection: $updateProfileModel.location) {
                            ForEach(locationProvince.allCases, id: \.self) { value in
                                Text("\(value.rawValue)").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                            }
                        }
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray).accentColor(updateProfileModel.location == .defaultValue ? ThemeColor.grayDark : .black)
                    }.padding(8).padding(.leading, 7)
                    Spacer()
                }
                .background(Color("lightGray"))
                .cornerRadius(10)
                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                .padding(.bottom, 5)
                .padding(.top, -5)
            }
            
            
        }
    }
}

struct ProfileBasicForm_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBasicForm(updateProfileModel: .constant(UpdateProfileModel()))
    }
}
