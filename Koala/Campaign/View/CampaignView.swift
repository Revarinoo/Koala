//
//  CampaignView.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import SwiftUI

struct CampaignView: View {
    
    @AppStorage("JWT", store: .standard) var token = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var campaignList = CampaignViewModel.shared
    @State private var campaignType = "Upcoming"
    var campaignTypes = ["Upcoming", "Completed"]
    @State var willMoveToTheNextScreen = false
    
    @State var isCreateModalShown = false
    @State var showUpcomingDetails = false
    @State var showCompletedDetails = false
    @State var upcomingID = 0
    @State var completedID = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .padding(.bottom, 14)
                Picker("Campaign Type?", selection: $campaignType) {
                    ForEach(campaignTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                ScrollView(.vertical){
                    VStack(spacing: 12){
                        ForEach(campaignList.campaignModel) { i in
                            if campaignType.contains("Upcoming") {
                                if i.status != "Completed" {
                                    
                                    Button(action: {
                                        upcomingID = i.content_id
                                        DispatchQueue.main.async() {
                                            // your code here
                                            upcomingID = i.content_id
                                            self.showUpcomingDetails = true
                                            print("IDNYE YE \(upcomingID)")
                                        }
                                       
                                    }){
                                        //CampaignUpcomingView(id: i.content_id)) {
                                        CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
                                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    }
                                    
//                                    NavigationLink(destination: CampaignUpcomingView(id: i.content_id)) {      CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
//                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
//                                    }
                                }
                            } else {
                                if i.status.contains("Completed") {
                                    Button(action: {
                                        
                                        completedID = i.content_id
                                        //DispatchQueue.main.async() {
                                            // your code here
                                            self.showCompletedDetails = true
                                        //}
                                        
                                    }){
                                        CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    }
//                                    NavigationLink(destination: CampaignDetailReportView(campaignID: i.content_id)) {
//                                        CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
//                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
//                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 90)
                }
            }
            .onAppear(perform: {
                campaignList.callGetCampaigns()
                campaignList.refresh()
            })
            
            .padding(.top, 10)
            .background(ThemeColor.background.ignoresSafeArea())
            .navigationBarTitle("My Campaigns", displayMode: .large)
            .navigationBarHidden(false)
            .navigationBarColor(backgroundColor: .clear, titleColor: .black, tintColor: UIColor(ThemeColor.primary))
            .toolbar {
                Button(action: {
                    self.isCreateModalShown = true
                }, label: {
                    Image(systemName: "plus")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                        .foregroundColor(Color.orange1)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 16))
                })
            }
            .fullScreenCover(isPresented: $showUpcomingDetails){
                CampaignUpcomingView(id: $upcomingID, isPresent: $showUpcomingDetails)
            }.onAppear(){
                print("IDNYAAA \(upcomingID)")
            }
            .fullScreenCover(isPresented: $showCompletedDetails){
                CampaignDetailReportView(isPresent: $showCompletedDetails, campaignID: $completedID)
            }.onAppear(){
                print("IDNYAAA \(completedID)")
            }
            .sheet(isPresented: $isCreateModalShown) {
                CreateCampaign(isPresent: $isCreateModalShown)
            }
            
        }
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
