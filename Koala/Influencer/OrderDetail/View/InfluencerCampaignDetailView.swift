
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
            VStack{
                Rectangle().fill(ThemeColor.primary)
                    .frame(height: 800).padding(.top,0).ignoresSafeArea(.all)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    InfluencerCampaignDetailFieldView(campaign: campaignVM.campaignModel, campaignDetail: campaignVM.campaignDetailModel)
                }
                .frame(width: UIScreen.main.bounds.width - 28, alignment: .leading)
                .padding(EdgeInsets(top: 60, leading: 28, bottom: 28, trailing: 0))
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
                VStack {
                    Button {
                        
                    } label: {
                        Text("Accept")
                            .padding(15)
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white)
                            .background(ThemeColor.primary)
                            .cornerRadius(15)
                    }
                    
                    .padding(.bottom, 8)
                    
                    Button {
                        
                    } label: {
                        Text("Decline")
                            .padding(15)
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                            .foregroundColor(ThemeColor.primary)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(ThemeColor.primary, lineWidth: 1)
                            )
                    }
                    
                    .padding(.bottom, 120)
                }
                .padding(.horizontal, 28)
            }
            
            HStack {
                WebImage(url: URL(string: campaignVM.campaignModel.business_photo))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    .shadow(color: ThemeColor.grayDark.opacity(0.4), radius: 3, x: 0, y: 5)
                    .padding(.trailing, 8)
                
                Text(campaignVM.campaignModel.business_name)
                    .font(Font.custom(ThemeFont.poppinsMedium, size: 16))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Chat")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 15))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 8, leading: 28, bottom: 8, trailing: 28))
                        .background(ThemeColor.primary)
                        .cornerRadius(10)
                }
                
            }
            .padding(EdgeInsets(top: -24, leading: 28, bottom: 0, trailing: 28))
            .frame(width: UIScreen.main.bounds.width, height: 96)
            .background(Color(hex: "F2F2F2"))
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            campaignVM.getOrderDetails(id: self.id)
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
