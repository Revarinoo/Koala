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
    
    private func dateFormatter(dateBefore: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        return dateFormatter.string(from: dateBefore)
    }
    
//    init() {
//        UIScrollView.appearance().bounces = false
//    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            ZStack(alignment: .top){
                VStack{
                    HStack{
                        Button(action:{
                            
                        }){
                            Image(systemName: "chevron.left")
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFit()
                        }.frame(width: 24, height: 24, alignment: .center)
                        
                        Spacer()
                        
                    }.padding(.horizontal, 16)
                        .padding(.top, 48)
                        .padding(.bottom, 140)
                    
                    VStack{
                        Text(campaignReportVM.campaignReportBusinessModel?.content_name ?? "not found").font(Font.custom(ThemeFont.poppinsSemiBold, size: 30))
                        
                        Text(dateFormatter(dateBefore:campaignReportVM.campaignReportBusinessModel?.dueDate ?? Date())).font(Font.custom(ThemeFont.poppinsMedium, size: 14)).padding(.bottom, 15)
                        Path() { path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
                        }
                        .stroke(Color.gray, lineWidth: 0.2)
                        .frame(height: 0.4)
                        
                        VStack (alignment: .leading) {
                            Text("Result")
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(.black)
                            ResultExpenseCard(price: Int(campaignReportVM.campaignReportBusinessModel?.totalExpense ?? 0))
                            HStack (alignment: .center) {
                                ForEach((campaignReportVM.campaignReportBusinessModel?.analytics) ?? [])
                                { analytic in
                                    let words = analytic.content_type.byWords
                                    ResultTypeCard(type: "\(words.last ?? "")", reachNum: "10.1K", impressionNum: "2.1K")
                                }
                            }
                        }
                        VStack (alignment: .leading){
                            Text("Influencer List")
                                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                .foregroundColor(.black)
                            ForEach ((campaignReportVM.campaignReportBusinessModel?.influencers) ?? []) { influencer in
                                let likes = Double(influencer.total_likes)/1000
                                let comments = Double(influencer.total_comments)/1000
                                ResultInfluencerCard(photoURL: influencer.photo, name: influencer.name, price: influencer.total_price, likeNum: "\(String(format: "%.1f", likes))K", commentNum: "\(String(format: "%.1f", comments))K", erNum: "\(influencer.engagement_rate)%")
                            }
                        }
                            
                    }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                        .ignoresSafeArea()
                        .padding(.top, 60)
                        .padding(.bottom, 60)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                }
                
                VStack{
                    
                    WebImage(url: URL(string: campaignReportVM.campaignReportBusinessModel?.campaign_logo ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 127, height: 127)
                        .cornerRadius(20.0)
                        .overlay(RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.white, lineWidth: 5))
                    
                }.padding(.top, 150)
            }
               
        }.navigationBarHidden(true)
            .onAppear(perform: {
                campaignReportVM.callGetCampaignReports(campaign_id: 1)
            })
                .background(ThemeColor.primary.ignoresSafeArea())
                .ignoresSafeArea()
    }
}

struct CampaignDetailReportView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignDetailReportView()
    }
}

extension StringProtocol {
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
            byWords.append(self[range])
        }
        return byWords
    }
}
