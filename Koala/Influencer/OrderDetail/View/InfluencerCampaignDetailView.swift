
import SwiftUI
import SDWebImageSwiftUI
import Introspect

struct InfluencerCampaignDetailView: View {
    
    @StateObject var campaignVM = InfluencerCampaignDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var uiTabarController: UITabBarController?
    
    var id: Int
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        InfluencerCampaignDetailFieldView(campaign: campaignVM.campaignModel, campaignDetail: campaignVM.campaignDetailModel)
                    }
                    .frame(width: UIScreen.main.bounds.width - 28, alignment: .leading)
                    .padding(EdgeInsets(top: 60, leading: 28, bottom: 100, trailing: 0))
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                
                HStack {
                    Text("Footer")
                }
                .background(Color(hex: "F2F2F2"))
            }
        }
        .onAppear {
            campaignVM.getOrderDetails(id: self.id)
            print(campaignVM.campaignDetailModel)
            print("id ye \(id)")
        }
        .introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden = true
            uiTabarController = UITabBarController
        }.onDisappear{
            uiTabarController?.tabBar.isHidden = false
        }
    }
}
