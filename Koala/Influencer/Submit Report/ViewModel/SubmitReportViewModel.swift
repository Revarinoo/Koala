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
    private let igThumbnailFetcher: ThumbnailImageFetcher = ThumbnailImageFetcher()
    
    func submit() {
        for content in contents {
            switch content.type {
            case .Post:
                igThumbnailFetcher.fetchInfo(igPost.link) { [unowned self] result in
                    
                    switch result {
                    case .success(let media):
                        
                        self.post_photo = media.images.thumbnail
                        
                        DispatchQueue.main.async {
                            service.submitReport(requestBody: ReportRequest(post_url: self.igPost.link, views: nil, likes: self.igPost.likes, comments: self.igPost.comments, reach: nil, impressions: nil, post_photo: self.post_photo, order_detail_id: content.orderDetailId)) { result in
                                if let response = result {
                                    if response.code == 201 {
                                        DispatchQueue.main.async {
                                            self.isSucceed = true
                                        }
                                    }
                                }
                            }
                        }
                        
                    case .failure(let error):
                        print("Request failed with error: \(error)")
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
                igThumbnailFetcher.fetchInfo(igPost.link) { [unowned self] result in
                    
                    switch result {
                    case .success(let media):
                        
                        self.post_photo = media.images.thumbnail
                        
                        DispatchQueue.main.async {
                            service.submitReport(requestBody: ReportRequest(post_url: igReels.link, views: igReels.views, likes: igReels.likes, comments: igReels.comments, reach: nil, impressions: nil, post_photo: nil ,order_detail_id: content.orderDetailId)) { result in
                                if let response = result {
                                    if response.code == 201 {
                                        DispatchQueue.main.async {
                                            self.isSucceed = true
                                        }
                                    }
                                }
                            }
                        }
                        
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                    }
                }
            default:
                isSucceed = false
            }
        }
    }
    
}