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
        var platforms: [PlatformModel] = []
        var categories: [String] = []
        var projects: [ProjectModel] = []
        var products: [ProductModel] = []

        influencerDetailService.getInfluencerDetail(influencer_id , completionHandler: { response in
            if let response = response {
                print(response)
                guard let unwrappedProfile = response.influencer_profile else {return}
                let unwrappedProjects = response.projects ?? []
                let unwrappedCategories = response.categories ?? []
                let unwrappedProducts = response.products

                influencer_profile = InfluencerProfileModel(id: unwrappedProfile.id, contact_email: unwrappedProfile.contact_email, rating: unwrappedProfile.rating, name: unwrappedProfile.name, location: unwrappedProfile.location ?? "", photo: unwrappedProfile.photo ?? "", user_id: unwrappedProfile.user_id, engagement_rate: unwrappedProfile.engagement_rate ?? 0.0)
                
                for platform in response.platforms {
                    platforms.append(PlatformModel(id: platform.id, name: platform.name, socialmedia_id: platform.socialmedia_id, followers: platform.followers, average_likes: platform.average_likes ?? 0.0, average_comments: platform.average_comments ?? 0.0))
                }

                for category in unwrappedCategories {
                    categories.append(category)
                }

                for product in unwrappedProducts {
                    products.append(ProductModel(content_type: product.content_type, minPrice: product.minPrice, maxPrice: product.maxPrice))
                }

                for project in unwrappedProjects {
                    projects.append(ProjectModel(id: project.order_id, business_photo: project.business_photo ?? "", business_name: project.business_name, total_likes: project.total_likes, total_comments: project.total_comments, engagement_rate: project.engagement_rate, comment: project.comment ?? ""))
                }

            }

            guard let unwrapped = influencer_profile else {return}
            influencer = InfluencerDetailModel(id: unwrapped.id, influencer_profile: unwrapped, categories: categories, platforms: platforms, products: products, projects: projects)
            //DispatchQueue.main.async {
                self.influencerModel = influencer
                print("idnya influencer \(influencer_id)")
            //}
        }
    )}
}
