//
//  CreateCampaign.swift
//  Koala
//
//  Created by Sholihatul Richas on 02/11/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Introspect

struct CreateCampaign: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var createCampaignVM = CreateCampaignViewModel()
    @StateObject var campaignList = CampaignViewModel()
    @State var campaignModel = CreateCampaignModel()
    @State var isCreated  = false
    @State var contentArray : [CreateContentModel] = [CreateContentModel(contentID: 0, contentType: productType.story, contentDetail: "", isDeleted: false)]
    @State var contentTypeArray = [ContentForm(firstContent: .constant(true), contentData: .constant(CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false)))]
    @State private var showSheet = false
    @State var willMoveToTheNextScreen = false
    @State private var contentCount = 0
    @State var contentArrayTemp: [CreateContentModel] = [CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false)]
    @State var isDoneButton = false
    @State var uiTabarController: UITabBarController?
    //keyboard thingy
    @StateObject private var keyboardHandler = KeyboardHandler()
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false){
                ZStack(alignment: .top){
                    VStack{
                        HStack{
                            Button(action:{
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .scaledToFit()
                            }.frame(width: 24, height: 24, alignment: .center)
                            Spacer()
                            Text("Create Campaign").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18)).foregroundColor(.white).frame(alignment: .center)
                            Spacer()
                        }.padding(.horizontal, 16)
                            .padding(.top, 48)
                            .padding(.bottom, 140)
                        
                        VStack(spacing: 18){
                            
                            CreateCampaignForm(campaignModel: $campaignModel)
                            ForEach (contentTypeArray.indices, id: \.self) { i in
                                ContentForm(firstContent: .constant(i == 0 ? true : false), contentData: $contentArrayTemp[i])
                            }.padding([.leading, .trailing], 16)
                            
                            Button(action: {
                                contentArrayTemp.append(CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false))
                                contentTypeArray.append(ContentForm(firstContent: .constant(true), contentData: .constant(CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false))))
                            }){
                                Image(systemName: "plus").font(.system(size: 24)).foregroundColor(ThemeColor.grayDark)
                            }.frame(maxWidth: .infinity)
                                .frame (height: 50)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(
                                            style: StrokeStyle(
                                                lineWidth: 2,
                                                dash: [7]
                                            )
                                        ).foregroundColor(ThemeColor.grayDark)
                                )
                                .padding([.leading, .trailing], 16)
                            Button(action: {
                                
                                willMoveToTheNextScreen = true
                                self.dismissKeyboard()
                                createCampaignVM.createContentModel = contentArrayTemp
                                createCampaignVM.submitData(submittedCampaign: campaignModel, submittedContent: contentArrayTemp)
                            }){
                                Text("Create").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                    .foregroundColor(.white)
                            }.frame(maxWidth: .infinity)
                                .frame (height: 50)
                                .background(ThemeColor.primary)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(ThemeColor.primary, lineWidth: 1)
                                )
                                .padding([.leading, .trailing], 16).padding(.bottom, 100).padding(.bottom, keyboardHandler.keyboardHeight)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                            .ignoresSafeArea()
                            .padding(.top, 110)
                            .background(Color.white)
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                        
                    }
                    VStack{
                        if campaignModel.logo.size.width == 0 {
                            Image(systemName: "photo").font(.system(size: 36)).foregroundColor(.gray).scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                                .overlay(RoundedRectangle(cornerRadius: 20.0)
                                            .stroke(Color.white, lineWidth: 5))
                                .onTapGesture {
                                    showSheet = true
                                }
                        } else {
                            Image(uiImage: campaignModel.logo).resizable().foregroundColor(.gray)
                                .scaledToFill().frame(width: 127, height: 127)
                                .background(ThemeColor.background)
                                .cornerRadius(20.0)
                                .overlay(RoundedRectangle(cornerRadius: 20.0)
                                            .stroke(Color.white, lineWidth: 5))
                                .onTapGesture {
                                    showSheet = true
                                }
                        }
                        
                        Text("Add Photo").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                    }.padding(.top, 150)
                }
                .introspectTabBarController { (UITabBarController) in
                                        UITabBarController.tabBar.isHidden = true
                                        uiTabarController = UITabBarController
                                    }.onDisappear{
                                        uiTabarController?.tabBar.isHidden = false
                                    }
            }.navigationBarHidden(true)
                .onTapGesture{
                    self.dismissKeyboard()
                }
            
                .background(ThemeColor.primary.ignoresSafeArea())
            
                .ignoresSafeArea()
                .sheet(isPresented: $showSheet) {
                    // Pick an image from the photo library:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $campaignModel.logo)
                }
                
            if willMoveToTheNextScreen
            {
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
        .onDisappear{
            campaignList.callGetCampaigns()
        }
        .navigate(to: CampaignView().onAppear(perform: {
            self.presentationMode.wrappedValue.dismiss()
        }), when: $createCampaignVM.isFinishedUploading)
    }
}

struct CreateCampaign_Previews: PreviewProvider {
    static var previews: some View {
        CreateCampaign()
    }
}
