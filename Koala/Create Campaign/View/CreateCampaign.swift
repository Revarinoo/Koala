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
    
    @StateObject var createCampaignVM = CreateCampaignViewModel()
    @StateObject var campaignList = CampaignViewModel()
    @State var campaignModel = CreateCampaignModel()
    @State var contentTypeArray = [ContentForm(firstContent: .constant(true), contentData: .constant(CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false)), contentArrayTemp: .constant([]))]
    @State private var showSheet = false
    @State var willMoveToTheNextScreen = false
    @State var contentArrayTemp: [CreateContentModel] = [CreateContentModel(contentType: .post, contentDetail: "", isDeleted: false)]
    @State var uiTabarController: UITabBarController?
    
    //keyboard thingy
    @StateObject private var keyboardHandler = KeyboardHandler()
    @Binding var isPresent : Bool
    
    
    //    init() {
    //        UIScrollView.appearance().bounces = false
    //    }
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            VStack(spacing: 18){
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
                                }//.background(ThemeColor.background)
                                CreateCampaignForm(campaignModel: $campaignModel)
                                ForEach (contentTypeArray.indices, id: \.self) { i in
                                    ContentForm(firstContent: .constant(i == 0 ? true : false), contentData: $contentArrayTemp[i], contentArrayTemp: $contentArrayTemp)
                                }.padding([.leading, .trailing], 16)
                                
                                Button(action: {
                                    contentArrayTemp.append(CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false))
                                    contentTypeArray.append(ContentForm(firstContent: .constant(true), contentData: .constant(CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false)), contentArrayTemp: $contentArrayTemp))
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
                                
                                
                            }//.frame(width: UIScreen.main.bounds.width, alignment: .top)
                            .ignoresSafeArea()
                            .padding(.top, 80)
                            .background(Color.white)
                            //.cornerRadius(20, corners: [.topLeft, .topRight])
                            
                        }.alert(isPresented: $createCampaignVM.dataisNotComplete) {
                            Alert(
                                title: Text("Data is Not Complete"),
                                message: Text("Make sure you fill out all the form"),
                                dismissButton: .default(Text("Got it!")){
                                    willMoveToTheNextScreen = false
                                }
                            )
                        }
                        //.padding(.top, 150)
                        VStack{
                            
                        }
                        .alert(isPresented: $createCampaignVM.dataHasSameType) {
                            Alert(
                                title: Text("Duplicated Content Type"),
                                message: Text("Make sure submit only one per content type"),
                                dismissButton: .default(Text("Got it!")){
                                    willMoveToTheNextScreen = false
                                }
                            )
                        }
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
            }
            .navigationTitle("Create Campaign")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresent = false
                    }.foregroundColor(ThemeColor.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        willMoveToTheNextScreen = true
                        self.dismissKeyboard()
                        createCampaignVM.createContentModel = contentArrayTemp
                        createCampaignVM.submitData(submittedCampaign: campaignModel, submittedContent: contentArrayTemp)
                    }.foregroundColor(ThemeColor.primary)
                }
            }
        }
        .onTapGesture {
            self.dismissKeyboard()
        }
        .preferredColorScheme(.light)
        .navigationAppearance(backgroundColor: .white, foregroundColor: .black, hideSeparator: true)
        .navigate(to: CampaignView().onAppear(perform: {
            self.presentationMode.wrappedValue.dismiss()
        }), when: $createCampaignVM.isFinishedUploading)
    }
}

struct CreateCampaign_Previews: PreviewProvider {
    static var previews: some View {
        CreateCampaign(isPresent: .constant(true))
    }
}
