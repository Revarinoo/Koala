//
//  InfluencerDetailViewModel.swift
//  Koala
//
//  Created by Clara Anggraini on 25/10/21.
//

import Foundation
import CloudKit

class InfluencerDetailViewModel: ObservableObject {
    static let shared = InfluencerDetailViewModel()
    @Published var influencerModel: InfluencerDetailModel?
    private let influencerDetailService: InfluencerDetailService = InfluencerDetailService()
    
    func callGetInfluencerDetail(influencer_id: Int) {
        var influencer: InfluencerDetailModel?
        var influencer_profile: InfluencerProfileModel?
        var analytic_photos: [AnalyticPhotoModel] = []
        var platforms: [PlatformModel] = []
        var categories: [String] = []
        var projects: [ProjectModel] = []
        
        influencerDetailService.getInfluencerDetail(influencer_id , completionHandler: { response in
            if let response = response {
                guard let unwrappedProfile = response.influencer_profile else {return}
                let unwrappedAnalytics = response.analytic_photos ?? []
                let unwrappedProjects = response.projects ?? []
                let unwrappedCategories = response.categories ?? []
                
                influencer_profile = InfluencerProfileModel(id: unwrappedProfile.id, contact_email: unwrappedProfile.contact_email, name: unwrappedProfile.name, location: unwrappedProfile.location ?? "", photo: unwrappedProfile.photo ?? "", user_id: unwrappedProfile.user_id, engagement_rate: unwrappedProfile.engagement_rate ?? 0.0)
                
                for analytic in unwrappedAnalytics{
                    analytic_photos.append(AnalyticPhotoModel(id: analytic.id, photo: analytic.photo))
                }
                
                for platform in response.platforms {
                    platforms.append(PlatformModel(id: platform.id, name: platform.name, socialmedia_id: platform.socialmedia_id, followers: platform.followers, average_likes: platform.average_likes ?? 0.0, average_comments: platform.average_comments ?? 0.0))
                }
                
                for category in unwrappedCategories {
                    categories.append(category)
                }
                
                for project in unwrappedProjects {
                    projects.append(ProjectModel(id: project.order_id, business_photo: project.business_photo ?? "", sum_impressions: project.sum_impressions ?? 0, sum_reach: project.sum_reach ?? 0, businessOwner_photo: project.businessOwner_photo ?? "", businessOwner_name: project.businessOwner_name, comment: project.comment ?? "", rating: project.rating ?? 0.0))
                }
                
            }

            guard let unwrapped = influencer_profile else {return}
            influencer = InfluencerDetailModel(id: unwrapped.id, influencer_profile: unwrapped, categories: categories, platforms: platforms, analytic_photos: analytic_photos, projects: projects)
            DispatchQueue.main.async {
                self.influencerModel = influencer
                print(influencer)
            }
        }
    )}
}
