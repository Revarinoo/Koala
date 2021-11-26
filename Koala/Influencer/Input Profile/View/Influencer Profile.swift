//
//  Influencer Profile.swift
//  Koala
//
//  Created by Sholihatul Richas on 24/11/21.
//

import SwiftUI

struct Influencer_Profile: View {
    @State var profilePhoto : UIImage = UIImage()
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    VStack{
                        if profilePhoto.size.width == 0 {
                            Image(systemName: "person").font(.system(size: 80)).foregroundColor(.gray).scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                                .overlay(RoundedRectangle(cornerRadius: 20.0)
                                            .stroke(Color.white, lineWidth: 5))
                                .padding(.top, 10)
                        } else {
                            Image(uiImage: profilePhoto).resizable().foregroundColor(.gray)
                                .scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                                .overlay(RoundedRectangle(cornerRadius: 20.0)
                                            .stroke(Color.white, lineWidth: 5))
                                .padding(.top, 10)
                        }
                    }
                    VStack(alignment: .leading, spacing: 18){
                        
                    }
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
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        //self.isPresent = false
                    }){
                        Text("Edit")
                        
                    }.foregroundColor(ThemeColor.primary)
                }
            }
        }
    }
}

struct Influencer_Profile_Previews: PreviewProvider {
    static var previews: some View {
        Influencer_Profile()
    }
}
