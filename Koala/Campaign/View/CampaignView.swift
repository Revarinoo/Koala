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
    @StateObject var campaignList = CampaignViewModel()
    @State private var campaignType = "Upcoming"
    var campaignTypes = ["Upcoming", "Completed"]
    @State var willMoveToTheNextScreen = false
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "primary")
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .trailing) {
                    Button(action: {
                        willMoveToTheNextScreen = true
                        //print("add new")
                    }, label: {
                        Image(systemName: "plus")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                            .foregroundColor(Color.orange1)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 18))
                    })
                    HStack {
                        Text("My Campaigns")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    }
                }
                Picker("Campaign Type?", selection: $campaignType) {
                    ForEach(campaignTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                
                ScrollView(.vertical){
                    VStack(spacing: 12){
                        ForEach(campaignList.campaignModel) { i in
                            if campaignType.contains("Upcoming") {
                                NavigationLink(destination: CampaignUpcomingView(id: i.content_id)) {
                                    if i.status != "Completed" {
                                        CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    }
                                }
                            } else {
                                NavigationLink(destination: CampaignDetailReportView(campaignID: i.content_id)) {
                                    if i.status.contains("Completed") {
                                        CampaignCard(photoURL: i.photo, name: i.name, date: i.schedule)
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .onAppear(perform: {
                campaignList.callGetCampaigns()
            })
            .ignoresSafeArea()
            .padding(.top, 10)
            .background(ThemeColor.background.ignoresSafeArea())
        }
        .navigate(to: CreateCampaign(), when: $willMoveToTheNextScreen)
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
