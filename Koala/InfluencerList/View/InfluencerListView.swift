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
            List {
                ForEach(influencerListVM.influencersModel) { influencer in
                    NavigationLink(destination: Text("Next Page")) {
                        HStack {
                            WebImage(url: URL(string: influencer.photo))
                                .resizable()
                                .frame(width: 150, height: 150)

                            VStack(alignment: .leading) {
                                Text(influencer.name)
                                    .font(.headline)
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
