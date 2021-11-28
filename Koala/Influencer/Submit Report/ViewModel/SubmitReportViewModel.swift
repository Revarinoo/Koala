//
//  SubmitReportViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import Foundation

enum ContentType: CaseIterable {
    case Post
    case Story
    case Reels
}

struct ContentStorage {
    let type: ContentType
    let orderDetailId: Int
}

class SubmitReportViewModel: ObservableObject {
    @Published var igPost: PostModel = PostModel()
    @Published var igStory: StoryModel = StoryModel()
    @Published var igReels: ReelsModel = ReelsModel()
    @Published var contents: [ContentStorage] = []
    @Published var isSucceed: Bool = false
    private var post_photo: String = ""
    
    private let service = SubmitReportService()
    
    func submit() {
        for content in contents {
            switch content.type {
            case .Post:
                service.submitReport(requestBody: ReportRequest(post_url: igPost.link, views: nil, likes: igPost.likes, comments: igPost.comments, reach: nil, impressions: nil,post_photo: post_photo , order_detail_id: content.orderDetailId)) { result in
                    if let response = result {
                        if response.code == 201 {
                            DispatchQueue.main.async {
                                self.isSucceed = true
                            }
                        }
                    }
                }
                
            case .Story:
                service.submitReport(requestBody: ReportRequest(post_url: nil, views: igStory.views, likes: nil, comments: nil, reach: igStory.reach, impressions: igStory.impression, post_photo: nil ,order_detail_id: content.orderDetailId)) { result in
                    if let response = result {
                        if response.code == 201 {
                            DispatchQueue.main.async {
                                self.isSucceed = true
                            }
                        }
                    }
                }
                
            case .Reels:
                service.submitReport(requestBody: ReportRequest(post_url: igReels.link, views: igReels.views, likes: igReels.likes, comments: igReels.comments, reach: nil, impressions: nil, post_photo: nil ,order_detail_id: content.orderDetailId)) { result in
                    if let response = result {
                        if response.code == 201 {
                            DispatchQueue.main.async {
                                self.isSucceed = true
                            }
                        }
                    }
                }
            default:
                isSucceed = false
            }
        }
    }
}
