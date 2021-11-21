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
    
    
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "primary")
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Campaign Type?", selection: $campaignType) {
                    ForEach(campaignTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
                
                ScrollView(.vertical){
                    VStack(spacing: 12){
                        ForEach(campaignList.campaignModel) { i in
                            if campaignType.contains("Upcoming") {
                                if i.status != "Completed" {
                                    NavigationLink(destination: CampaignUpcomingView(id: i.content_id)) {      CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    }
                                }
                            } else {
                                if i.status.contains("Completed") {
                                    NavigationLink(destination: CampaignDetailReportView(campaignID: i.content_id)) {
                                        CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    }
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
            .navigationBarTitle("My Campaigns")
            .navigationBarHidden(false)
            .toolbar {
                Button(action: {
                    self.isCreateModalShown = true
                    //print("add new")
                }, label: {
                    Image(systemName: "plus")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                        .foregroundColor(Color.orange1)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 16))
                })
            }
            .sheet(isPresented: $isCreateModalShown) {
                CreateCampaign(isPresent: $isCreateModalShown)
            }
        }
//        .navigate(to: CreateCampaign(), when: $willMoveToTheNextScreen)
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
