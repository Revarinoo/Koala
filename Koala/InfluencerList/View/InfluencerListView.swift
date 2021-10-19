//
//  InfluencerListView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct InfluencerListView: View {
    
    @ObservedObject var influencerListVM = InfluencerListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bgColorView.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Image("filterIcon")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 10))
                            .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                            .background(ThemeColor.primary)
                            .cornerRadius(10)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: -2, leading: 10, bottom: 8, trailing: 0))
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(influencerListVM.influencersModel) { influencer in
                                NavigationLink(destination: Text("NexT Page")) {
                                    InfluencerCardList(photoURL: influencer.photo, categories: influencer.category, name: influencer.name, location: influencer.location, price: influencer.ratePrice, ER: influencer.rateEngagement, rating: influencer.rating)
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Influencer List"), displayMode: .inline)
        }
        .onAppear() {
            influencerListVM.callGetInfluencerList()
        }
    }
}

struct InfluencerListView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerListView()
    }
}
