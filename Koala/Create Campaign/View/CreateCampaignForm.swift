//
//  CreateCampaignForm.swift
//  Koala
//
//  Created by Sholihatul Richas on 03/11/21.
//

import SwiftUI

struct CreateCampaignForm: View {
    @Binding var campaignModel : CreateCampaignModel
    @State var showSheet = false
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            VStack(alignment: .leading, spacing: 6){
                Text("Title")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextField("Enter your campaign title", text: $campaignModel.title).textFieldStyle(OvalTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 6){
                Text("Start Date")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                DatePicker("", selection: $campaignModel.startDate, in: Date()..., displayedComponents: [.date]).padding(5)
                    .background(Color("lightGray"))
                    .cornerRadius(10)
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                    .padding(.bottom, 5)
                    .padding(.top, -5)
            }
            VStack(alignment: .leading, spacing: 6){
                Text("End Date")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                DatePicker("", selection: $campaignModel.endDate, in: Date()..., displayedComponents: [.date]).padding(5)
                    .background(Color("lightGray"))
                    .cornerRadius(10)
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                    .padding(.bottom, 5)
                    .padding(.top, -5)
            }
            
            TextArea(textTitle: "Product", product: $campaignModel.product, textFieldHeight: 63, placeHolderText: "Enter your product", fieldBackgroundColor: Color("lightGray"))
            
            TextArea(textTitle: "Description", product: $campaignModel.description, textFieldHeight: 172, placeHolderText: "Enter your descriptions", fieldBackgroundColor: Color("lightGray"))

            TextArea(textTitle: "Rules", product: $campaignModel.rules, textFieldHeight: 172, placeHolderText: "Enter your rules", fieldBackgroundColor: Color("lightGray"))

            VStack(alignment: .leading, spacing: 6){
                Text("References")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                ScrollView(.horizontal){
                    HStack(spacing: 12){
                        if $campaignModel.references.count == 0{
                            Image(systemName: "photo").font(.system(size: 24)).foregroundColor(.gray)
                                .scaledToFill()
                                .frame(width: 82, height: 88)
                                .background(ThemeColor.background)
                                .cornerRadius(10.0).onTapGesture {
                                    showSheet = true
                                }
                            Image(systemName: "plus").font(.system(size: 24)).foregroundColor(.gray)
                                .scaledToFill()
                                .frame(width: 82, height: 88)
                                .background(ThemeColor.background)
                                .cornerRadius(10.0)
                        } else {
                            ForEach (campaignModel.references, id: \.self) { images in
                                Image(uiImage : images).resizable()//.foregroundColor(.gray)
                                    .scaledToFill()
                                    .frame(width: 82, height: 88)
                                    .background(ThemeColor.background)
                                    .cornerRadius(10.0).onTapGesture {
                                        //showSheet = true
                                    }
                            }
                            
                            Image(systemName: "plus").font(.system(size: 24)).foregroundColor(.gray)
                                .scaledToFill()
                                .frame(width: 82, height: 88)
                                .background(ThemeColor.background)
                                .cornerRadius(10.0).onTapGesture {
                                    showSheet = true
                                }
                        }
                    }.padding(.bottom, 10)
                }
            }
        }.padding([.leading, .trailing], 16).ignoresSafeArea()
            .background(Color.white.ignoresSafeArea())
            .sheet(isPresented: $showSheet) {
                ImagePickerReferences(referenceImages: $campaignModel.references)
            }
    }
}

//struct CreateCampaignForm_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateCampaignForm()//.preferredColorScheme(.dark)
//    }
//}
