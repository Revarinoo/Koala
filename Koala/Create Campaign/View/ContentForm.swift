//
//  ContentForm.swift
//  Koala
//
//  Created by Sholihatul Richas on 04/11/21.
//

import SwiftUI

struct ContentForm: View, Identifiable {
    
    let id = UUID()
    @Binding var firstContent : Bool
//    @State var content = CreateContentModel(contentType: "", contentDetail: "", isDeleted: false)
    //@Binding var isCreated : Bool
    @Binding var contentData : CreateContentModel
//    @Binding var contentArray : [CreateContentModel]
//    @State private var productTypee : productType = .post
    @State var contentDetail = ""
    
//    init(){
//        //self.firstContent = firstContent
//        //_contentData = contentData
//        //_contentArray = contentArray
//        //_isCreated = isCreated
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ThemeColor.primary)
//        UISegmentedControl.appearance().backgroundColor = UIColor(ThemeColor.background)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
//        UINavigationBar.appearance().backgroundColor = UIColor(ThemeColor.background)
//        UIPickerView.appearance().backgroundColor = UIColor(ThemeColor.primary)
//    }
    
    var body: some View {
        if contentData.isDeleted == false{
            VStack{
                if #available(iOS 15.0, *) {
                    VStack(alignment: .leading){
                        Text("Content Type")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(ThemeColor.grayDark)
                        HStack{
                            Section{
                                Picker("Number of people", selection: $contentData.contentType) {
                                    ForEach(productType.allCases, id: \.self) { value in
                                        Text("\(value.rawValue)").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                                    }
                                }//.pickerStyle(WheelPickerStyle())
                                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray).accentColor(ThemeColor.primary)
                            }.padding(8)
                            Spacer()
                        }.background(.white).cornerRadius(12)
                            
                        
                        
                    }.padding(16)
                } else {
                    // Fallback on earlier versions
                }
                VStack(alignment: .leading, spacing: 22){

                    TextArea(textTitle: "Content", product: $contentData.contentDetail, textFieldHeight: 172, placeHolderText: "Enter your package detail", fieldBackgroundColor: .white)
                    if !firstContent{
                        Button(action: {
                            contentData.isDeleted = true
                            self.hidden()
                        }){
                            Text("Delete").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                .foregroundColor(Color.red).onTapGesture {
                                    contentData.isDeleted = true
                                    self.hidden()
                                }
                        }.frame(maxWidth: .infinity)
                            .frame (height: 38)
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    
                }.padding(.horizontal, 16).padding(.bottom, 25)
            }
            .onAppear(perform: {
                        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ThemeColor.primary)
                        UISegmentedControl.appearance().backgroundColor = UIColor(ThemeColor.background)
                        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
                        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
                        UINavigationBar.appearance().backgroundColor = UIColor(ThemeColor.background)
                        UIPickerView.appearance().backgroundColor = UIColor(ThemeColor.primary)
            })
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.945, blue: 0.929)/*@END_MENU_TOKEN@*/).cornerRadius(10)
        }
    }
}

//struct ContentForm_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentForm(firstContent: true)
//    }
//}
