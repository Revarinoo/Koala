//
//  InfluencerListView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import SwiftUI

struct InfluencerListView: View {
    
    @ObservedObject var influencerListVM = InfluencerListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(influencerListVM.influencersModel) { influencer in
                    NavigationLink(destination: InfluencerDetailView(username: influencer.igUsername)) {
                        VStack(alignment: .leading) {
                            Text(influencer.name)
                                .font(.headline)
                                .bold()
                            HStack {
                                Text(influencer.igUsername)
                                    .font(.caption)
                                Spacer()
                                Text("Mulai dari Rp. \(influencer.ratePrice)")
                                    .font(.caption)
                                    .bold()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Influencer List")
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
