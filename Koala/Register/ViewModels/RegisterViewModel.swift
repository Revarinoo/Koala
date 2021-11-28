//
//  RegisterViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 22/10/21.
//  Edited by Syahrul Fadholi

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthenticate = false
    @Published var isPresentingErrorAlert = false
    @Published var errorMessage = ""
    @Published var username = ""
    
    @AppStorage("role", store: .standard) var role = ""
    @AppStorage("JWT", store: .standard) var token = ""
    
    private let accountInfoFetcher: AccountInfoFetcher = AccountInfoFetcher()
    private let feedIgFetcher: FeedIgFetcher = FeedIgFetcher()
    private let registerService: RegisterService = RegisterService()
    
    private var igFollowersCount: Int = 1
    private var igEngagementRate: Double = 0.0
    private var igAvgLikes: Double = 0.0
    private var igAvgComments: Double = 0.0
    
    func validate() -> Bool {
        if email.isEmpty || password.isEmpty {
           errorMessage = "User email and password cannot be empty!"
            return false
        }
        if !isValidEmail(value: email) {
            errorMessage = "Email format is incorrect!"
            return false
        }
        if role == "Influencer" && username.isEmpty {
            errorMessage = "Username Instagram cannot be empty!"
            return false
        }
        
        return true
    }
    
    private func isValidEmail(value: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
        return regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) != nil
    }
    
    private func calcEngagementRate(likes: Double, comments: Double, followers: Double) -> Double {
        
        let ER = (likes + comments) / followers * 100
        return ER
    }
    
    func callGetAccInfo() {
        accountInfoFetcher.fetchInfo(username) { [unowned self] result in

            switch result {
            case .success(let profile):
                
                self.igFollowersCount = profile.figures.followers
            
                DispatchQueue.main.async {
                    callGetFeedData()
                }
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
            
        }
    }
    
    func callGetFeedData() {
        feedIgFetcher.fetchFeed(username) { [unowned self] result in
            
            var likes: [Double] = []
            var comments: [Double] = []
            var ERs: [Double] = []
            
            switch result {
            case .success(let feed):
                
                for igPost in feed.prefix(20) {
                    let likesCount = Double(igPost.figures.likes_count)
                    let commentsCount = Double(igPost.figures.comments_count)
                    let engagementRate = self.calcEngagementRate(likes: likesCount, comments: commentsCount, followers: Double(self.igFollowersCount))
                    
                    likes.append(likesCount)
                    comments.append(commentsCount)
                    ERs.append(engagementRate)
                }
                
                let avgOfLikes = likes.reduce(0, +) / 20
                let avgOfComments = comments.reduce(0, +) / 20
                let avgOfERs = ERs.reduce(0, +) / 20
                
                self.igAvgLikes = avgOfLikes
                self.igAvgComments = avgOfComments
                self.igEngagementRate = avgOfERs
                
                DispatchQueue.main.async {
                    callRegisterService()
                }
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
            
        }
    }
    
    func callRegisterService() {
        registerService.register(
            RegisterRequest(name: name, email: email, password: password, type_role: role, platform_name: "Instagram", socialmedia_id: username, engagement_rate: self.igEngagementRate, followers: self.igFollowersCount, average_likes: self.igAvgLikes, average_comments: self.igAvgComments)) { response in
            if let code = response?.code, let message = response?.message {
                if code == 201, let access_token = response?.access_token {
                    DispatchQueue.main.async {
                        self.token = access_token
                        self.isAuthenticate = true
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.isPresentingErrorAlert = true
                        self.errorMessage = message
                    }
                }
            }
        }
    }
    
    func register() {
        if !validate() { isPresentingErrorAlert.toggle() }
        
        if role == "Influencer" {
            callGetAccInfo()
        }
        else {
            callRegisterService()
        }
    }
}
