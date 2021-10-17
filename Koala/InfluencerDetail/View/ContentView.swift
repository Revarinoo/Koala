//
//  ContentView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var influencerDetailVM = InfluencerDetailViewModel()
    
    var body: some View {
        VStack {
            Text("username IG \(influencerDetailVM.influencerModel.username)")
            Text("followers IG \(influencerDetailVM.influencerModel.followers)")
            Text("engagement rate IG \(influencerDetailVM.influencerModel.engagementRate) %")
        }
        .onAppear() {
            influencerDetailVM.callGetAccInfo(username: "asokaremadjas")
            influencerDetailVM.callGetFeedData(username: "asokaremadjas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
