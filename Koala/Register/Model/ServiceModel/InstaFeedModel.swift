//
//  InstaFeedModel.swift
//  InstaDecodeAPI
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import Foundation

struct InstaFeedModel: Codable {
    let data: [FeedData]
}

struct FeedData: Codable {
    let post_url: String
    let figures: PostStats
}

struct PostStats: Codable {
    let video_views: Int
    let likes_count: Int
    let comments_count: Int
}
