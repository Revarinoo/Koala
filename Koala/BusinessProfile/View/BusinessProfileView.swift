//
//  BusinessProfileView.swift
//  Koala
//
//  Created by Clara Anggraini on 28/11/21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct BusinessProfileView: View {
    
    @AppStorage("JWT", store: .standard) var token = ""
    @StateObject var businessProfileVM = BusinessProfileViewModel.shared
    @State var signOut = false
    @State var toEditProfile = false

    var body: some View {
        NavigationView{
            ScrollView (showsIndicators: false){
                VStack(alignment: .leading){
                    HStack{
                        Spacer()
                        if businessProfileVM.businessProfileModel.business_photo != "" {
                            WebImage(url: URL(string: businessProfileVM.businessProfileModel.business_photo ?? ""))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 127, height: 127)
                                .cornerRadius(20.0)
                        }
                        else {
                            Image(systemName: "person").font(.system(size: 36)).foregroundColor(.gray).scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                        }
                        Spacer()
                    }.padding(.top, 10)
                        .padding(.bottom, 24)
                    
                    VStack(alignment : .leading, spacing: 18){
                        ProfileElement(title:"Business Name", data: $businessProfileVM.businessProfileModel.business_name ?? "")
                        ProfileElement(title:"Location", data: $businessProfileVM.businessProfileModel.location ?? "")
                        ProfileElement(title:"Instagram", data: $businessProfileVM.businessProfileModel.instagram ?? "")
                        ProfileElement(title:"Website", data: $businessProfileVM.businessProfileModel.website ?? "")
                        ProfileElement(title:"Description", data: $businessProfileVM.businessProfileModel.description ?? "")
                            .padding(.bottom, 100)
                        Button(action:{
                            self.signOut = true
                            token = ""
                        }){
                            Text("Sign Out").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(.white)
                                .padding()
                                .padding([.leading, .trailing])
                                .frame(height: 38)
                        }.frame(maxWidth: .infinity)
                            .frame (height: 50)
                            .background(Color(.red))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(ThemeColor.primary, lineWidth: 1)
                            )
                            .padding(.top, 24)
                    }
                }.padding([.leading, .trailing], 16)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.toEditProfile = true
                    }){
                        Text("Edit")
                        
                    }.foregroundColor(ThemeColor.primary)
                }
            }
            .background(ThemeColor.background.ignoresSafeArea())
            
        }
        .onAppear{
            businessProfileVM.getBusinessProfile()
        }
        .sheet(isPresented: $toEditProfile){
            InputBusinessProfileView(businessProfileVM: businessProfileVM, isPresent: $toEditProfile)
        }
        .navigate(to: LoginView(), when: $signOut)
    }
}

struct BusinessProfileView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessProfileView()
    }
}




