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
    
    var campaignID: Int
    
//    init(campaignID: Int) {
//        UIScrollView.appearance().bounces = false
//        self.campaignID = campaignID
//    }
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView(.vertical, showsIndicators: false){
                    ZStack(alignment: .top){
                        VStack{
                            HStack{
        //                        Button(action:{
        //                            self.presentationMode.wrappedValue.dismiss()
        //                        }){
        //                            Image(systemName: "chevron.left")
        //                                .resizable()
        //                                .foregroundColor(.white)
        //                                .scaledToFit()
        //                        }.frame(width: 24, height: 24, alignment: .center)
        //
        //                        Spacer()
                                
                            }.padding(.horizontal, 16)
                                .padding(.top, 72)
                                .padding(.bottom, 140)
                            
                            VStack{
                                Text(campaignReportVM.campaignReportBusinessModel?.content_name ?? "not found").font(Font.custom(ThemeFont.poppinsSemiBold, size: 30))
                                    .multilineTextAlignment(.center)
                                
                                Text(dateFormatter(dateBefore:campaignReportVM.campaignReportBusinessModel?.dueDate ?? Date())).font(Font.custom(ThemeFont.poppinsMedium, size: 14)).padding(.bottom, 15)
                                
                                VStack (alignment: .leading) {
                                    Text("Result")
                                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                        .foregroundColor(.black)
                                    ResultExpenseCard(price: Int(campaignReportVM.campaignReportBusinessModel?.totalExpense ?? 0))
                                    HStack (alignment: .center) {
                                        ForEach((campaignReportVM.campaignReportBusinessModel?.analytics) ?? [])
                                        { analytic in
                                            let words = analytic.content_type.byWords
                                            ResultTypeCard(type: "\(words.last ?? "")", reachNum: "\(numberPrint(number: analytic.total_reach))", impressionNum: "\(numberPrint(number: analytic.total_imp))")
                                        }
                                    }
                                    if ((campaignReportVM.campaignReportBusinessModel?.influencers?.isEmpty) != nil) {
                                        Text("Influencer List")
                                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                                            .foregroundColor(.black)
                                        ForEach ((campaignReportVM.campaignReportBusinessModel?.influencers) ?? []) { influencer in
                                            ResultInfluencerCard(photoURL: influencer.photo, name: influencer.name, price: influencer.total_price, likeNum: "\(numberPrint(number: influencer.total_likes))", commentNum: "\(numberPrint(number: influencer.total_comments))", erNum: "\(engagePrint(number: influencer.engagement_rate))")
                                        }
                                    }
                                }
                                    
                            }.frame(width: UIScreen.main.bounds.width, alignment: .top)
                                .ignoresSafeArea()
                                .padding(.top, 60)
                                .padding(.bottom, 100)
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
                }
                VStack{
                    Rectangle().fill(ThemeColor.primary)
                        .frame(height: 88)//.padding(.top,)
                    Spacer()
                }
            }
            
            
            .navigationBarHidden(false)
            .navigationAppearance(backgroundColor: UIColor(ThemeColor.primary), foregroundColor: UIColor(ThemeColor.primary), hideSeparator: true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.isPresent = false
                    }){
                        HStack{
                            Image(systemName: "chevron.left")
                            Text("My Campaigns")
                        }
                        
                    }.foregroundColor(.white)
                }
            }
                .onAppear(perform: {
                    campaignReportVM.callGetCampaignReports(campaign_id: campaignID)
                })
                    .background(ThemeColor.primary.ignoresSafeArea())
                    .ignoresSafeArea()
                    .transition(.move(edge: .trailing))
        }
        
    }
}

struct CampaignDetailReportView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignDetailReportView(isPresent: .constant(true), campaignID: 1)
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
