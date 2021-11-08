//
//  UserProfileViewModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 01/11/21.
//

import Foundation

class UserProfileViewModel: ObservableObject{
    @Published var user : UserProfileData = UserProfileData(name: "", photo: "", location: "")
    private let userProfileService : UserProfileService = UserProfileService()
    
    
    func callData(){
        var userData : UserProfileData = UserProfileData(name: "", photo: "", location: "")
        userProfileService.getUserProfile(){ response in
            userData.name = response?.name ?? "Guest"
            userData.photo = response?.photo ?? ""
            userData.location = response?.location ?? "Kemanggisan"
        }
        DispatchQueue.main.async {
            self.user = userData
        }
    }
}
