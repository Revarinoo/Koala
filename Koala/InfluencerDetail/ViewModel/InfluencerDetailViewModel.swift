//
//  InfluencerDetailViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

class InfluencerDetailViewModel: ObservableObject {
    
    @Published var influencerModel: InfluencerDataModel = InfluencerDataModel()
    private let igService: InstagramService = InstagramService()
    private var igFollowersCount: Int = 1
    
    func callGetAccInfo(username: String) {
        igService.getAccInfo(username: username) { response in
            DispatchQueue.main.async {
                self.influencerModel.username = response?.data.username ?? ""
                self.influencerModel.posts = response?.data.figures.posts ?? 0
                self.igFollowersCount = response?.data.figures.followers ?? 1
                self.influencerModel.followers = self.igFollowersCount
                self.influencerModel.following = response?.data.figures.followings ?? 0
            }
        }
    }
    
    func callGetFeedData(username: String) {
        var ERs: [Double] = []
        igService.getFeedData(username: username) { response in
            if let responseData = response?.data {
                for igPost in responseData.prefix(20) {
                    let likes = Double(igPost.figures.likes_count)
                    let comments = Double(igPost.figures.comments_count)
                    
                    let engagementRate = self.calcEngagementRate(likes: likes, comments: comments, followers: Double(self.igFollowersCount))
                    
                    print(engagementRate)
                    ERs.append(engagementRate)
                }
            }
            
            DispatchQueue.main.async {
                let avgOfERs = ERs.reduce(0, +) / 20
                self.influencerModel.engagementRate = avgOfERs
            }
        }
    }
    
    func calcEngagementRate(likes: Double, comments: Double, followers: Double) -> Double {
        
        let ER = (likes + comments) / followers * 100
        print(ER)
        return ER
    }
}
