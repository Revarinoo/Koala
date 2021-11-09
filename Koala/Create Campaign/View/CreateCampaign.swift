//
//  CreateCampaign.swift
//  Koala
//
//  Created by Sholihatul Richas on 02/11/21.
//

import SwiftUI
import SDWebImageSwiftUI


struct CreateCampaign: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var createCampaignVM = CreateCampaignViewModel()
    @State var campaignModel = CreateCampaignModel()
    @State var isCreated  = false
    @State var contentArray : [CreateContentModel] = [CreateContentModel(contentID: 0, contentType: productType.story, contentDetail: "", isDeleted: false)]
    @State var contentTypeArray = [ContentForm(firstContent: .constant(true), contentData: .constant(CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false)))]
    @State var image = UIImage()
    @State private var showSheet = false
    @State var willMoveToTheNextScreen = false
    @State private var contentCount = 0
    @State var contentArrayTemp: [CreateContentModel] = [CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false)]
    //var counter = 1
    
    init() {
        UIScrollView.appearance().bounces = false
        //contentTypeArray =  [ContentForm(firstContent: true)]
    }
    
    var body: some View {
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
                            //contentTypeArray.append(ContentForm(firstContent: false))
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
                                                            lineWidth: 1,
                                                            dash: [25]
                                                        )
                                    ).foregroundColor(ThemeColor.grayDark) 
                            )
                            .padding([.leading, .trailing], 16)
                        Button(action: {
                            createCampaignVM.createContentModel = contentArrayTemp
                            createCampaignVM.submitData(submittedCampaign: campaignModel, submittedContent: contentArrayTemp)
                            willMoveToTheNextScreen = true
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
                            .onTapGesture(){
                                createCampaignVM.createContentModel = contentArrayTemp
                                createCampaignVM.submitData(submittedCampaign: campaignModel, submittedContent: contentArrayTemp)
                                //createCampaignVM.submitContent()
                                //createCampaignVM.submitContent(submittedContent: createCampaignVM.createContentModel)
                            }
                            .padding([.leading, .trailing], 16).padding(.bottom, 80)
                        
                    }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                        .ignoresSafeArea()
                        .padding(.top, 110)
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
                VStack{
                    
                    //WebImage(url: URL(string:  "https://assets.teenvogue.com/photos/5fd4d29fe6ff71e902f97c1a/4:3/w_2443,h_1832,c_limit/taylor-evermore-resized.jpg"))
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
            
        }.navigationBarHidden(true)
        
            .background(ThemeColor.primary.ignoresSafeArea())
        
            .ignoresSafeArea()
            .sheet(isPresented: $showSheet) {
                // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: $campaignModel.logo)
            }
            .navigate(to: CampaignView(), when: $willMoveToTheNextScreen)
    }
}

struct CreateCampaign_Previews: PreviewProvider {
    static var previews: some View {
        CreateCampaign()
    }
}
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}
