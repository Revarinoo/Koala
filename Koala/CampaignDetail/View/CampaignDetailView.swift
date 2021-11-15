//
//  CampaignDetailView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import SwiftUI
import Introspect

struct CampaignDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var campaignDetailVM = CampaignDetailViewModel()
    @State var uiTabarController: UITabBarController?
    
    var campaignTitle: String
    var contentID: Int
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                            .foregroundColor(ThemeColor.primary)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text(campaignTitle)
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 17))
                        .padding(.trailing)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 14, trailing: 0))
                
                Text("Tasks")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .padding(.leading, 16)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(campaignDetailVM.campaignTasks) { task in
                            CampaignTaskCard(productName: task.contentType, instructions: task.instruction)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .accentColor(.white)
        .navigationBarHidden(true)
        .onAppear() {
            campaignDetailVM.callGetCampaignDetail(contentID)
        }
        .introspectTabBarController { (UITabBarController) in
                                UITabBarController.tabBar.isHidden = true
                                uiTabarController = UITabBarController
                            }.onDisappear{
                                uiTabarController?.tabBar.isHidden = false
                            }
    }
}

//struct CampaignDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CampaignDetailView(campaignTitle: "10.10 Campaign", contentID: 1)
//    }
//}
