//
//  InputProfileView.swift
//  Koala
//
//  Created by Sholihatul Richas on 23/11/21.
//

import SwiftUI

struct InputProfileView: View {
    
    @State var text = ""
    @State var province : locationProvince = .aceh
    @ObservedObject var influencerSpecialty = InfluencerSpecialty()
    
    let columns = [
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack{
                    VStack{
    //                    if campaignModel.logo.size.width == 0 {
                            Image(systemName: "camera").font(.system(size: 36)).foregroundColor(.gray).scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                                .overlay(RoundedRectangle(cornerRadius: 20.0)
                                            .stroke(Color.white, lineWidth: 5))
                               // .onTapGesture {
                                   // showSheet = true
                               // }
    //                    } else {
    //                        Image(uiImage: campaignModel.logo).resizable().foregroundColor(.gray)
    //                            .scaledToFill().frame(width: 127, height: 127)
    //                            .background(ThemeColor.background)
    //                            .cornerRadius(20.0)
    //                            .overlay(RoundedRectangle(cornerRadius: 20.0)
    //                                        .stroke(Color.white, lineWidth: 5))
    //                            .onTapGesture {
    //                                showSheet = true
    //                            }
    //                    }
                        
                        Text("Add Photo").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                    }
                    ProfileBasicForm()
                    LazyVGrid(columns: columns) {
                        ForEach(influencerSpecialty.interest.indices) { index in
                            Button(action: {
                                if influencerSpecialty.countSpecialtyClicked() < 3 || influencerSpecialty.interest[index].isClicked == true {
                                    influencerSpecialty.interest[index].isClicked.toggle()
                                }
                            }, label: {
                                Text(influencerSpecialty.interest[index].name)
                                    .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                    .padding(.vertical, 4)
                                    .frame(minWidth: 110, minHeight: 40)
                                    .foregroundColor(influencerSpecialty.interest[index].isClicked ? ThemeColor.primary : ThemeColor.grayDark)
                                    .background(influencerSpecialty.interest[index].isClicked ? ThemeColor.primaryLight : .white)
                                    .cornerRadius(10)
                                    .padding(.bottom, 10)
                            })
                        }
                    }
                }.padding([.leading, .trailing], 16)
            }
        }
        
    }
}

struct InputProfileView_Previews: PreviewProvider {
    static var previews: some View {
        InputProfileView()
    }
}
