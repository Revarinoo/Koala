//
//  InfluencerListViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

class InfluencerListViewModel: ObservableObject {
    
    @Published var influencersModel: [InfluencerListModel] = []
    private let influencerListService: InfluencerListService = InfluencerListService()
    private var influencerRate: Int = 0
    
    func callGetInfluencerList() {
        var influencers: [InfluencerListModel] = []
        influencerListService.getInfluencerList() { response in
            if let responseData = response?.data {
                for influencer in responseData {
                    let id = influencer.influencer_id
                    let name = influencer.influencer_name
                    let photo = "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"
                    let category = influencer.categories
                    let price = influencer.price
                    let location = influencer.location ?? "Jakarta"
                    let rating = influencer.rating ?? 4.1231
                    let engagementRate = influencer.engagement_rate ?? 3.751
                    
                    let influencerModel = InfluencerListModel(id: id, name: name, photo: photo, location: location, rating: rating, category: category, ratePrice: price, rateEngagement: engagementRate)
                    
                    influencers.append(influencerModel)
                }
            }
            
            DispatchQueue.main.async {
                self.influencersModel = influencers
            }
        }
    }
    
    func callGetInfluencerByCategory(_ category: String) {
        var influencers: [InfluencerListModel] = []
        influencerListService.getInfluencerByCategory(category) { response in
            if let responseData = response?.data {
                for influencer in responseData {
                    let id = influencer.influencer_id
                    let name = influencer.influencer_name
                    let photo = "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"
                    let category = influencer.categories
                    let price = influencer.price
                    let location = influencer.location ?? "Jakarta"
                    let rating = influencer.rating ?? 4.1231
                    let engagementRate = influencer.engagement_rate ?? 3.751
                    
                    let influencerModel = InfluencerListModel(id: id, name: name, photo: photo, location: location, rating: rating, category: category, ratePrice: price, rateEngagement: engagementRate)
                    
                    influencers.append(influencerModel)
                }
            }
            
            DispatchQueue.main.async {
                self.influencersModel = influencers
            }
        }
    }
}
