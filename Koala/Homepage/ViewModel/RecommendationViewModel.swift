//
//  RecommendationViewModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 21/10/21.
//

import Foundation

class RecommendationViewModel: ObservableObject {
    
    @Published var recommendationModel: [RecommendationInfluencerModel] = []
    private let recomendationService: RecommendationInfluencerService = RecommendationInfluencerService()
    
    func callGetInfluencerList(categories: [String]) {
        var recommendation: [RecommendationInfluencerModel] = []
        recomendationService.getRecomended(categories: categories) { response in
            if let responseData = response?.rec_influencers {
                for influencer in responseData {
                    let id = influencer.influencer_id
                    let name = influencer.influencer_name
                    let photo =  influencer.influencer_photo ?? HttpUtility.defaultImages
                    let category = influencer.categories
                    let price = influencer.price
                    
                    let influencerModel = RecommendationInfluencerModel(id: id, name: name, photo: photo, category: category, price: price)
                    recommendation.append(influencerModel)
                }
            }
            
            DispatchQueue.main.async {
                self.recommendationModel = recommendation
            }
        }
    }
}
