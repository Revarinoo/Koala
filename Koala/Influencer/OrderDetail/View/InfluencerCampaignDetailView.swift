
import SwiftUI
import SDWebImageSwiftUI
import Introspect

enum CampaignStatus: String, CaseIterable{
    case accepted = "Accepted"
    case rejected = "Rejected"
}

struct InfluencerCampaignDetailView: View {
    
    @StateObject var campaignVM = InfluencerCampaignDetailViewModel.shared
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var uiTabarController: UITabBarController?
    @State private var showingAlert = false
    @State private var showingModalSheet = false
    @State private var showingPriceSheet = false
    @State private var seletedType = ""
    @State private var seletedOrderID = 0
    @State private var showingWaitingButton = false
    @StateObject var chatRoomVM = ChatRoomViewModel()
    @State private var isChat = false
    
    var id: Int
    var status: String
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack{
                WebImage(url: URL(string: campaignVM.campaignModel.campaign_logo))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 390)
                    .padding(.top,0)
                    .ignoresSafeArea(.all)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false) {
                ZStack(alignment: .bottomLeading) {
                    VStack {
                        InfluencerCampaignDetailFieldView(campaign: campaignVM.campaignModel, campaignDetail: campaignVM.campaignDetailModel)
                        
                        VStack {
                            ForEach(campaignVM.campaignPriceModel, id: \.id) { price in
                                HStack {
                                    VStack (alignment: .leading, spacing: 6) {
                                        Text(price.content_type)
                                            .font(.custom(ThemeFont.poppinsRegular, size: 14))
                                            .foregroundColor(Color.init(hex: "A7A7A7"))
                                        Text(price.price == 0 ? "No price yet" : "Rp \(price.price.rupiahFormatter())")
                                            .font(.custom(ThemeFont.poppinsRegular, size: 16))
                                            .frame(maxWidth: 334, alignment: .leading)
                                    }
                                    Spacer()
                                    
                                    if price.price == 0 {
                                        Button(action: {
                                            self.seletedType = price.content_type
                                            self.seletedOrderID = price.order_detail_id
                                            self.showingPriceSheet = true
                                        }, label: {
                                            Text("Input Price")
                                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 15))
                                                .padding(EdgeInsets(top: 6, leading: 28, bottom: 6, trailing: 28))
                                                .foregroundColor(.white)
                                                .background(ThemeColor.primary)
                                                .cornerRadius(10)
                                        })
                                            .padding(.top, 20)
                                    }
                                    
                                }
                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 28))
                            }
                        }
                        .padding(.bottom, campaignVM.campaignPriceModel.allSatisfy({ $0.price != 0 }) ? 0 : 88)
                        
                        if (campaignVM.campaignPriceModel.allSatisfy({ $0.price != 0 }) && status != "Accepted") {
                            VStack {
                                Button {
                                    if status == "Pending" {
                                        campaignVM.submitCampaignStatus(id, status: CampaignStatus.accepted.rawValue)
                                    } else {
                                        self.showingModalSheet = true
                                    }
                                } label: {
                                    Text(status == "Pending" ? "Accept" : "Submit Report")
                                        .padding(15)
                                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                        .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(ThemeColor.primary)
                                        .cornerRadius(15)
                                }
                                .padding(.bottom, 8)
                                .alert(isPresented: $campaignVM.campaignModel.isPresentingStatusAlert) {
                                    Alert(title: Text(campaignVM.campaignModel.alertTitle), message: Text(campaignVM.campaignModel.alertMessage), dismissButton: .cancel(Text("Ok"), action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                        self.showingWaitingButton = true
                                    }))
                                }
                                
                                if status == "Pending" {
                                    Button {
                                        showingAlert.toggle()
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
                                    .alert(isPresented: $showingAlert) {
                                        Alert(
                                            title: Text("Decline Campaign"),
                                            message: Text("Are you sure you want decline this campaign?"),
                                            primaryButton: .default(Text("Cancel"), action: {}),
                                            secondaryButton: .destructive(Text("Decline").font(Font.custom(ThemeFont.poppinsBold, size: 14)).bold(), action: {
                                                campaignVM.submitCampaignStatus(id, status: CampaignStatus.rejected.rawValue)
                                            })
                                        )
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 88, trailing: 28))
                        }
                        
                        if (status == "Accepted") {
                            VStack {
                                Text("Waiting For Payment")
                                    .padding(15)
                                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                    .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color(hex: "A7A7A7"))
                                    .cornerRadius(15)
                            }
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 88, trailing: 28))
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width - 28, alignment: .leading)
                    .padding(EdgeInsets(top: 24, leading: 28, bottom: 28, trailing: 0))
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
                .padding(.top, 160)
            }
            
            VStack {
                Spacer()
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
                    
                    NavigationLink(destination: TabBarInfluencer(selectedTab: .constant(1)).navigationBarHidden(true), isActive: $isChat) {
                        Button {
                            self.isChat = chatRoomVM.createChatRoom(target: campaignVM.targetUserId)
                            
                        } label: {
                            Text("Chat")
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 15))
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 8, leading: 28, bottom: 8, trailing: 28))
                                .background(ThemeColor.primary)
                                .cornerRadius(10)
                        }
                    }
                    
                }
                .padding(EdgeInsets(top: -24, leading: 28, bottom: 0, trailing: 28))
                .frame(width: UIScreen.main.bounds.width, height: 96)
                .background(Color(hex: "F2F2F2"))
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarColor(backgroundColor: .clear, titleColor: .black, tintColor: UIColor(.white))
        .onAppear {
            campaignVM.getOrderDetails(id: self.id)
        }
        .sheet(isPresented: $showingModalSheet){
            SubmitReportView(isModalPresented: $showingModalSheet, orderId: self.id)
        }
        .sheet(isPresented: $showingPriceSheet) {
            SubmitPriceView(isModalPresented: $showingPriceSheet, serviceType: seletedType, orderDetailId: seletedOrderID, orderId: self.id)
        }
        .introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden = true
            uiTabarController = UITabBarController
        }.onDisappear{
            uiTabarController?.tabBar.isHidden = false
        }
    }
}

//struct InfluencerCampaignDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfluencerCampaignDetailView
//    }
//}
