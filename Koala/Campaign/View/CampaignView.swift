//
//  CampaignView.swift
//  Koala
//
//  Created by Jonathan Clive on 27/10/21.
//

import SwiftUI

struct CampaignView: View {
    let campaigns = CampaignViewModel().campaigns
    @State private var campaignType = "Upcoming"
    var campaignTypes = ["Upcoming", "Completed"]
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "primary")
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                Button(action: {
                    print("add new")
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
                    ForEach(campaigns){ i in
                        if campaignType.contains("Upcoming") {
                            if i.campaignDate >= Date().addingTimeInterval(-86400) {
                                CampaignCard(photoURL: i.campaignPhoto, name: i.campaignName, package: i.campaignPackage, date: i.campaignDate, price: i.campaignPrice)
                                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            }
                        } else {
                            if i.campaignDate < Date().addingTimeInterval(-86400) {
                                CampaignCard(photoURL: i.campaignPhoto, name: i.campaignName, package: i.campaignPackage, date: i.campaignDate, price: i.campaignPrice)
                                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .padding(.top, 10)
        .background(ThemeColor.background.ignoresSafeArea())
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
