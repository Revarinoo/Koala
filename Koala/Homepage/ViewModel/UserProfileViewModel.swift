//
//  UserProfileViewModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 01/11/21.
//

import Foundation

class UserProfileViewModel: ObservableObject{
    @Published var user : UserProfileData = UserProfileData(name: "", photo: "")
    private let userProfileService : UserProfileService = UserProfileService()
    
    func signOut() {
        user = UserProfileData(name: "", photo: "")
        callData()
    }
    
    func callData(){
        userProfileService.getUserProfile(){ response in
            if let name = response?.name, let photo = response?.photo {
                DispatchQueue.main.async {
                    self.user = UserProfileData(name: name, photo: "http://34.124.208.0/Koala-backend/public/storage/images/" + photo)
                }
            }
        }
    }
}
