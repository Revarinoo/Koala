//
//  BusinessProfileView.swift
//  Koala
//
//  Created by Clara Anggraini on 27/11/21.
//

import Foundation
import SwiftUI

struct InputBusinessProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var businessProfileVM = BusinessProfileViewModel.shared
    @State var showImagePicker = false
    @Binding var isPresent : Bool
    @State var uploadingView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView(showsIndicators: false){
                    VStack(spacing: 18){
                        VStack{
                            if businessProfileVM.inputBusinessProfileModel.business_photo.size.width == 0 {
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
                                Image(uiImage: businessProfileVM.inputBusinessProfileModel.business_photo).resizable().foregroundColor(.gray)
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
                        
                        BusinessProfileForm(inputBusinessProfileModel: $businessProfileVM.inputBusinessProfileModel)
                            .padding(.bottom, 42)
                        
                    }.padding([.leading, .trailing], 16)
                    
                }
                
                if uploadingView{
                    ThemeColor.primary.ignoresSafeArea()
                    VStack(spacing: 25){
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: ThemeColor.secondary))
                            .scaleEffect(3)
                        Text("Uploading Your Data").foregroundColor(.white).font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                        Spacer()
                    }
                }
            }
            
            .onTapGesture(){
                self.dismissKeyboard()
            }
            
            .alert(isPresented: $businessProfileVM.dataError) {
                Alert(
                    title: Text(businessProfileVM.errorTitle),
                    message: Text(businessProfileVM.errorMessage),
                    dismissButton: .default(Text("Got it!")){
                        uploadingView = false
                    }
                )
            }.sheet(isPresented: $showImagePicker) {
                
                ImagePicker(sourceType: .photoLibrary, selectedImage: $businessProfileVM.inputBusinessProfileModel.business_photo)
                    
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(){
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.isPresent = false
                    }){
                        Text("Cancel")
                    }.foregroundColor(ThemeColor.primary)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        uploadingView.toggle()
                        businessProfileVM.validateInput()
                    }){
                        Text("Save")
                    }.foregroundColor(ThemeColor.primary)
                }
            }
            
        }
        .navigationAppearance(backgroundColor: UIColor(ThemeColor.background), foregroundColor: .black)
        .onChange(of: businessProfileVM.isFinishedUpload){ _ in
            self.businessProfileVM.getBusinessProfile()
            self.businessProfileVM.isFinishedUpload = false
            self.uploadingView = false
            self.isPresent = false

        }
    }
}

struct InputBusinessProfileView_Previews: PreviewProvider {
    static var previews: some View {
        InputBusinessProfileView(isPresent: .constant(true))
    }
}
