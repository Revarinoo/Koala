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
    @Binding var contentData : CreateContentModel
    @Binding var contentArrayTemp : [CreateContentModel]
    
    func optionContentDynamic(contentArray: [CreateContentModel]) -> [productType]{
        var currentContentTypeOption : [productType] = [.post, .story, .reels]
        for type in contentArray{
            if type.isDeleted == false {
                currentContentTypeOption = currentContentTypeOption.filter{
                    $0 != type.contentType
                }
            }
        }
        return currentContentTypeOption
    }
    
    var body: some View {
        if contentData.isDeleted == false{
            VStack{
                    VStack(alignment: .leading){
                        Text("Content Type")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                            .foregroundColor(ThemeColor.grayDark)
//                        HStack{
//                            DatePicker("", selection: $campaignModel.startDate, in: Date()..., displayedComponents: [.date]).padding([.top, .bottom], 5)
//                                .fixedSize()
//                            Spacer()
//                            Image(systemName: "calendar").font(.system(size: 24)).padding(.trailing, 10).foregroundColor(ThemeColor.grayDark)
//                        }
//
//                            .background(Color("lightGray"))
//                            .cornerRadius(10)
//                            .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
//                            .padding(.bottom, 5)
//                            .padding(.top, -5)
                        HStack{
                            Section{
                                Picker("Number of people", selection: $contentData.contentType) {
                                    ForEach(productType.allCases, id: \.self) { value in
                                        Text("\(value.rawValue)").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                                    }
                                }
                                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray).accentColor(ThemeColor.primary)
                            }.padding(8)
                            Spacer()
                        }//.cornerRadius(12)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .padding(.bottom, 5)
                        .padding(.top, -5)
                            
                        
                        
                    }.padding(16)
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
