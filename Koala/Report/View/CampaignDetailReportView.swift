//
//  CampaignDetailReportView.swift
//  Koala
//
//  Created by Jonathan Clive on 29/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CampaignDetailReportView: View {
    @StateObject var campaignReportVM = CampaignReportBusinessViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isPresent : Bool
    @Binding var campaignID: Int
    
    private func dateFormatter(dateBefore: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        return dateFormatter.string(from: dateBefore)
    }
    
    private func numberPrint(number: Int) -> String {
        var numberString = ""
        if number == 0 {
            numberString = "N/A"
        } else if number < 1000 {
            numberString = "\(number)"
        } else {
            let numberDivided = Double(number)/1000
            numberString = "\(String(format: "%.1f", numberDivided))K"
        }
        return numberString
    }
    
    private func engagePrint(number: Double) -> String {
        if number == 0 {
            return "N/A"
        } else {
            return "\(number)%"
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView(.vertical, showsIndicators: false){
                    ZStack(alignment: .top){
                        VStack{
                            WebImage(url: URL(string: "https://pbs.twimg.com/profile_images/949787136030539782/LnRrYf6e.jpg"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }.frame(width: 390,height: 390)
                        
                        VStack{
                            
                             HStack{
                             }.padding(.horizontal, 16)
                                 .padding(.vertical, 161)
                            
                            VStack(alignment: .center, spacing: 16) {
                                
                                VStack (alignment: .center) {
                                    Text(campaignReportVM.campaignReportBusinessModel?.content_name ?? "not found").font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                                        .multilineTextAlignment(.center)
                                    
                                    Text(dateFormatter(dateBefore:campaignReportVM.campaignReportBusinessModel?.dueDate ?? Date())).font(Font.custom(ThemeFont.poppinsMedium, size: 16)).padding(.bottom, 15)
                                    
                                    Divider()
                                }
                                                                
                                VStack (alignment: .leading) {
                                    Text("Result")
                                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                    VStack (alignment: .center) {
                                        ResultExpenseCard(price: Int(campaignReportVM.campaignReportBusinessModel?.totalExpense ?? 0))
                                        HStack (alignment: .center) {
                                            ForEach((campaignReportVM.campaignReportBusinessModel?.analytics) ?? [])
                                            { analytic in
                                                let words = analytic.content_type.byWords
                                                ResultTypeCard(type: "\(words.last ?? "")", reachNum: "\(numberPrint(number: analytic.total_reach))", impressionNum: "\(numberPrint(number: analytic.total_imp))")
                                            }
                                        }
                                    }
                                    if ((campaignReportVM.campaignReportBusinessModel?.influencers?.isEmpty) != nil) {
                                        Text("Influencer List")
                                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                            .foregroundColor(.black)
                                            .padding(.leading)
                                        VStack (alignment: .center){
                                            ForEach ((campaignReportVM.campaignReportBusinessModel?.influencers) ?? []) { influencer in
                                                ResultInfluencerCard(photoURL: influencer.photo, name: influencer.name, price: influencer.total_price, likeNum: "\(numberPrint(number: influencer.total_likes))", commentNum: "\(numberPrint(number: influencer.total_comments))", erNum: "\(engagePrint(number: influencer.engagement_rate))")
                                            }
                                        }
                                    }
                                }
                                    
                            }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                                .ignoresSafeArea()
                                .padding(.top, 25)
                                .padding(.bottom, 100)
                            .background(Color.white)
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                            
                        }
                    }
                }
            }
            .background(ThemeColor.primary.ignoresSafeArea())
            .ignoresSafeArea()
            .onAppear(perform: {
                campaignReportVM.callGetCampaignReports(campaign_id: campaignID)
            })
//            .transition(.move(edge: .trailing))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false).accentColor(.white)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.isPresent = false
                    }){
                        HStack{
                            Image(systemName: "chevron.left")
                        }
                        
                    }.foregroundColor(.white)
                }
            }
        }
    }
}

//struct CampaignDetailReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        CampaignDetailReportView(isPresent: .constant(true), campaignID: .constant(1))
//    }
//}

extension StringProtocol {
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
            byWords.append(self[range])
        }
        return byWords
    }
}
