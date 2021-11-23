//
//  UserProfileViewModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 01/11/21.
//

import Foundation
import SwiftUI

class UserProfileViewModel: ObservableObject{
    static let shared = UserProfileViewModel()
    @Published var user : UserProfileData = UserProfileData(id: 1, name: "", photo: "")
    private let userProfileService : UserProfileService = UserProfileService()
    
    func signOut() {
        user = UserProfileData(id: 1, name: "", photo: "")
        callData()
    }
    
    func callData(){
        userProfileService.getUserProfile(){ response in
            if let name = response?.name, let photo = response?.photo, let id = response?.id {
                DispatchQueue.main.async {
                    self.user = UserProfileData(id: id, name: name, photo: "https://koala-influencer.xyz/storage/images/" + photo)
                }
            }
        }
    }
}
