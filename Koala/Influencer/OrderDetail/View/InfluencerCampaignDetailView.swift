
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
                    ZStack(alignment: .top) {
                        VStack {
                            InfluencerCampaignDetailFieldView(campaign: campaignVM.campaignModel, campaignDetail: campaignVM.campaignDetailModel)
                        }
                        .frame(width: UIScreen.main.bounds.width - 28, alignment: .leading)
                        .padding(EdgeInsets(top: 60, leading: 28, bottom: 100, trailing: 0))
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
                
                
                HStack {
                    WebImage(url: URL(string: campaignVM.campaignModel.business_photo))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.white, lineWidth: 5))
                    Text(campaignVM.campaignModel.business_name)
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 16))
                    
                    Text("Chat")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 15))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
                        .background(ThemeColor.primary)
                        .cornerRadius(10)
                }
                
                .frame(width: UIScreen.main.bounds.width, height: 96)
                .background(Color(hex: "F2F2F2"))
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
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

struct InfluencerCampaignDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerCampaignDetailView(id: 1)
    }
}
