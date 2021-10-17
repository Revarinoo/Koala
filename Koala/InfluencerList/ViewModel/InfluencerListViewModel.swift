//
//  InfluencerListViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

class InfluencerListViewModel: ObservableObject {
    
    @Published var influencersModel: [InfluencerModel] = []
    private let influencerListService: InfluencerListService = InfluencerListService()
    private var influencerRate: Int = 0
    
    func callGetInfluencerRatePrice(_ influencerID: Int) {
        var ratePrice: Int = 0
        influencerListService.getInfluencerRatePrice(influencerID) { response in
            ratePrice = response?.rate ?? 0
            
            DispatchQueue.main.async {
                self.influencerRate = ratePrice
            }
        }
    }
    
    func callGetInfluencerList() {
        var influencers: [InfluencerModel] = []
        influencerListService.getInfluencerList() { response in
            if let responseData = response?.data {
                for influencer in responseData {
                    let id = influencer.influencer_id
                    let name = influencer.name
                    let photo = influencer.photo ?? ""
                    let category = influencer.category
                    let igUsername = influencer.socialmedia_id
                    
                    self.callGetInfluencerRatePrice(id)
                    print(self.influencerRate)
                    
                    let influencerModel = InfluencerModel(id: id, name: name, photo: photo, category: category, igUsername: igUsername, ratePrice: self.influencerRate)
                    
                    influencers.append(influencerModel)
                }
            }
            
            DispatchQueue.main.async {
                self.influencersModel = influencers
            }
        }
    }
}
