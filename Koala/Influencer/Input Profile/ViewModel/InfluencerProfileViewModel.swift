//
//  InfluencerProfileViewModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 24/11/21.
//

import Foundation
import SwiftUI
import Alamofire

class InfluencerProfileViewModel : ObservableObject {
    
    @AppStorage("JWT", store: .standard) var token = ""
    @Published var updateProfileModel : UpdateProfileModel = UpdateProfileModel()
    @Published var influencerProfile : InfluencerProfileData = InfluencerProfileData(name: "", email: "", photo: "", instagram: "", location: "", specialty: [], storyMax: 0, storyMin: 0, postMax: 0, postMin: 0, reelsMax: 0, reelsMin: 0)
    @Published var dataNotComplete = false
    @Published var numberIsNotValid = false
    
    var influencerService = InfluencerService()
    
    func validateInput(){
        if influencerProfile.name == "" {
            self.dataNotComplete = true
            return
        }
    }
    
    func callInfluencerData(){
        print("calllll")
        influencerService.getInfluencer() {
            response in
            print(response)
            if let code = response?.code {
                print(code)
                if code == 201 {
                    DispatchQueue.main.async {
                        self.influencerProfile.name = response?.influencer_name ?? ""
                        self.influencerProfile.email = response?.email ?? ""
                        self.influencerProfile.instagram = response?.instagram ?? ""
                        self.influencerProfile.location = response?.location ?? ""
                        self.influencerProfile.photo = response?.photo ?? ""
                        if let product = response?.products{
                            for prod in product {
                                if prod.product_type == "Instagram Post" {
                                    self.influencerProfile.postMax = prod.max_rate
                                    self.influencerProfile.postMin = prod.min_rate
                                } else if prod.product_type == "Instagram Story" {
                                    self.influencerProfile.storyMax = prod.max_rate
                                    self.influencerProfile.storyMin = prod.min_rate
                                } else {
                                    self.influencerProfile.reelsMax = prod.max_rate
                                    self.influencerProfile.reelsMin = prod.min_rate
                                }
                            }
                        }
                        if let specialties = response?.specialty{
                            for specialty in specialties {
                                if !self.influencerProfile.specialty.contains(specialty.name){
                                    self.influencerProfile.specialty.append(specialty.name)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func submitProfileData(_ data: UpdateProfileModel){
        let defaultImage = UIImage(named: "defaultCampaign")!.jpegData(compressionQuality: 0.5)
        let profileImage = data.image.jpegData(compressionQuality: 0.5) ?? defaultImage
        
        let parameters : [String : String] =
        [
            "type_role" : "Influencer",
            "name": data.name,
            "location" : data.location.rawValue,
            //"categories" : data.categories,
            "email" : data.email,
            "socialmedia_id" : data.socialMedia,
            "post_min_rate" : data.postMin,
            "post_max_rate" : data.postMax,
            "story_min_rate" : data.storyMin,
            "story_max_rate" : data.storyMax,
            "reels_min_rate" : data.reelsMin,
            "reels_max_rate" : data.reelsMax
        ]

        let headers: HTTPHeaders = [
            "Authorization": "Bearer 2|fDUQdBRfJ28oEcg7A9LeccSfzzBb1H4WekgCmKH5",
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append((profileImage ?? defaultImage) ?? Data(), withName: "image",fileName: "\(data.socialMedia).jpeg", mimeType: "image/jpeg")
            
//            for (key, value) in updateProfileRequest {
//                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//
//                                }
            for (key, value) in parameters {
                        if let temp = value as? String {
                            multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                            print(value)
                            print("KEYNYA \(key)")
                        }
                        if let temp = value as? Int {
                            multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                            print(value)
                            print("KEYNYA \(key)")
                        }
                    }
            for category in self.influencerProfile.specialty {
                print("thiosca \(category)")
                multipartFormData.append(category.data(using: .utf8)!, withName: "categories[]")
            }
            print("INIDATA \(multipartFormData)")
        }, to: "http://127.0.0.1:8000/api/profile/update", method: .post , headers: headers)
        { (result) in
            print(result)
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    if progress.fractionCompleted == 1.0 {
                        
                    }
                })
                
                upload.responseData { response in
                    if let code = response.response?.statusCode{
                        print(response)
                        print("KODE \(code)")
                        if code == 200 {
                            let campaignResponse = try? JSONDecoder().decode(UpdateInfluencerProfileResponse.self, from: response.value as! Data)
                            print(campaignResponse)
                            //print(res)
                        } else {
                        }
                    }
                }
                
            case .failure(let encodingError):
                print("failure!!!!")
                print(encodingError)
            }
        }
        
    }
}
