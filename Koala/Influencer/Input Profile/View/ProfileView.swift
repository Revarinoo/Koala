//
//  ProfileView.swift
//  Koala
//
//  Created by Sholihatul Richas on 25/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    
    @AppStorage("JWT", store: .standard) var token = ""
    @StateObject var updateProfileVM = InfluencerProfileViewModel()
    @State var signOut = false
    @State var toEditProfile = false
    @State var showUpdateProfile = false
    
//    init(){
//        updateProfileVM.callInfluencerData()
//    }
    var body: some View {
        NavigationView{
            VStack{
                if showUpdateProfile {
                    UpdateProfileInfluencer(showSheet: $toEditProfile).background(Color.white)
                } else {
                    ScrollView (showsIndicators: false){
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                                if updateProfileVM.influencerProfile.photo != "" {
                                    WebImage(url: URL(string: updateProfileVM.influencerProfile.photo))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 127, height: 127)
                                        .background(ThemeColor.secondary)
                                        .cornerRadius(20.0)
                                }
                                else {
                                    Image(systemName: "person").font(.system(size: 36)).foregroundColor(.gray).scaledToFill().frame(width: 127, height: 127)
                                        .background(ThemeColor.background)
                                        .cornerRadius(20.0)
                                }
                                Spacer()
                            }.padding(.top, 10)
                            
                            VStack(alignment : .leading, spacing: 18){
                                ProfileElement(title:"Name", data: $updateProfileVM.influencerProfile.name)
                                ProfileElement(title:"Email", data: $updateProfileVM.influencerProfile.email)
                                ProfileElement(title:"Instagram", data: $updateProfileVM.influencerProfile.instagram)
                                ProfileElement(title:"Location", data: $updateProfileVM.influencerProfile.location)
                                SpecialtyElement(title: "Specialties", data: $updateProfileVM.influencerProfile.specialty)
                                PriceElement(title: "Instagram Post Price", minRate: $updateProfileVM.influencerProfile.postMin, maxRate: $updateProfileVM.influencerProfile.postMax)
                                PriceElement(title: "Instagram Story Price", minRate: $updateProfileVM.influencerProfile.storyMin, maxRate: $updateProfileVM.influencerProfile.storyMax)
                                PriceElement(title: "Instagram Reels Price", minRate: $updateProfileVM.influencerProfile.reelsMin, maxRate: $updateProfileVM.influencerProfile.reelsMax)
                                
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
                                    .background(Color(.systemRed))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(ThemeColor.primary, lineWidth: 1)
                                    )
                                    .padding(.top, 24)
                            }
                        }.padding([.leading, .trailing], 16)
                    }
                }
                
            }
            
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !showUpdateProfile{
                        Button(action: {
                            self.toEditProfile = true
                        }){
                            Text("Edit")
                        }.foregroundColor(ThemeColor.primary)
                    }
                }
            }
            .background(ThemeColor.background.ignoresSafeArea())
            
        }
        
            .onAppear(){
                updateProfileVM.callInfluencerData()
                if updateProfileVM.influencerProfile.location == ""{
                    showUpdateProfile = true
                }
            }
            .sheet(isPresented: $toEditProfile){
                InputProfileView(isPresent: $toEditProfile)
            }
            
            .navigate(to: LoginView(), when: $signOut)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileElement : View {
    
    var title : String
    @Binding var data : String
    
    var body : some View {
        VStack(alignment : .leading, spacing: 6){
            Text(title).font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
            Text(data).font(Font.custom(ThemeFont.poppinsRegular, size: 16)).foregroundColor(.black)
        }
    }
}

struct SpecialtyElement : View {
    
    var title : String
    @Binding var data : [String]
    
    
    var body : some View {
        VStack(alignment : .leading, spacing: 6){
            Text(title).font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
            Text(data.joined(separator: ", ")).font(Font.custom(ThemeFont.poppinsRegular, size: 16)).foregroundColor(.black)
        }
    }
}

struct PriceElement : View {
    var title : String
    @Binding var minRate : Int
    @Binding var maxRate : Int
    
    var body : some View {
        VStack(alignment : .leading, spacing: 6){
            Text(title).font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
            Text("Rp \(minRate) - Rp \(maxRate)").font(Font.custom(ThemeFont.poppinsRegular, size: 16)).foregroundColor(.black)
        }
    }
}
