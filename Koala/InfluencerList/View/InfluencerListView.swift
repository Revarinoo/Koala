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
            .navigationBarHidden(true)
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
