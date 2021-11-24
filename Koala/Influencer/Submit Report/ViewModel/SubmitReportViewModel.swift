//
//  SubmitReportViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import Foundation

class SubmitReportViewModel: ObservableObject {
    @Published var igPost: PostModel = PostModel()
    @Published var igStory: StoryModel = StoryModel()
    @Published var igReels: ReelsModel = ReelsModel()
    
    func submit() {
        print(igPost)
        print(igStory)
        print(igReels)
    }
}
