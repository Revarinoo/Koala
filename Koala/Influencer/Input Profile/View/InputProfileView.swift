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
    @State var profilePhoto : UIImage = UIImage()
    @State var showImagePicker = false
    
    let columns = [
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack(spacing: 18){
                    VStack{
                        if profilePhoto.size.width == 0 {
                            Image(systemName: "camera").font(.system(size: 36)).foregroundColor(.gray).scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                                .overlay(RoundedRectangle(cornerRadius: 20.0)
                                            .stroke(Color.white, lineWidth: 5))
                                .onTapGesture {
                                    showImagePicker = true
                                }
                            Text("Add Photo").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                        } else {
                            Image(uiImage: profilePhoto).resizable().foregroundColor(.gray)
                                .scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                                .overlay(RoundedRectangle(cornerRadius: 20.0)
                                            .stroke(Color.white, lineWidth: 5))
                                .onTapGesture {
                                    showImagePicker = true
                                }
                            Text("Change Photo").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                        }
                    }.padding(.top, 30)
                    ProfileBasicForm()
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Specialty").font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                                .foregroundColor(ThemeColor.grayDark)
                            Text("Choose 3 food categories you specialize").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                .foregroundColor(ThemeColor.grayDark)
                        }
                        Spacer()
                    }
                    
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
                                //
                            }).overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(influencerSpecialty.interest[index].isClicked ? ThemeColor.primary : ThemeColor.grayDark, lineWidth: 1)
                            )
                                .padding(.bottom, 10)
                        }
                    }
                    
                    PriceForm()
                    
                    Button(action:{
                        
                    }){
                        Text("Next").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            .foregroundColor(.white)
                            .padding()
                            .padding([.leading, .trailing])
                            .frame(height: 38)
                    }.frame(maxWidth: .infinity)
                        .frame (height: 50)
                        .background(ThemeColor.primary)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(ThemeColor.primary, lineWidth: 1)
                        )
                        .padding(.top, 24)
                    
                }.padding([.leading, .trailing], 16)
            }
            .sheet(isPresented: $showImagePicker) {
                // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $profilePhoto)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct InputProfileView_Previews: PreviewProvider {
    static var previews: some View {
        InputProfileView()
    }
}
