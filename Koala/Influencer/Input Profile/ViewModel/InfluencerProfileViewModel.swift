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
    @Published var dataError = false
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    @Published var isFinishedUpload = false
    
    var influencerService = InfluencerService()
    
    func validateInput(){
        if updateProfileModel.name == "" || updateProfileModel.specialties == [] || updateProfileModel.email == "" || updateProfileModel.socialMedia == "" || updateProfileModel.location == locationProvince.defaultValue {
            self.errorTitle = "Data is Not Complete"
            self.errorMessage = "Make sure to fill out all the form."
            self.dataError = true
            return
        }
        if !isValidEmail(value: updateProfileModel.email){
            self.errorTitle = "Wrong Email Format"
            self.errorMessage = "Make sure your email format is correct."
            self.dataError = true
            return
        }
        if updateProfileModel.image.size.width == 0 {
            self.errorTitle = "Data is Not Complete"
            self.errorMessage = "Please input your profile photo."
            self.dataError = true
            return
        }
        if updateProfileModel.socialMedia.containsWhitespace{
            self.errorTitle = "Wrong Format"
            self.errorMessage = "Make sure your Instagram account contains no space."
            self.dataError = true
            return
        }
        
        if !updateProfileModel.reelsMax.isInt || !updateProfileModel.reelsMin.isInt || !updateProfileModel.storyMax.isInt || !updateProfileModel.storyMin.isInt || !updateProfileModel.postMax.isInt || !updateProfileModel.postMin.isInt {
            self.errorTitle = "Wrong Format"
            self.errorMessage = "Make sure your put number on the price form."
            self.dataError = true
            return
        }
        
        submitProfileData(updateProfileModel)
        
    }
    
    private func isValidEmail(value: String) -> Bool
    {
        let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
        return regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) != nil
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
            "Authorization": "Bearer \(token)",
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append((profileImage ?? defaultImage) ?? Data(), withName: "image",fileName: "\(data.socialMedia).jpeg", mimeType: "image/jpeg")
            
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
            for category in data.specialties {
                print("thiosca \(category)")
                multipartFormData.append(category.data(using: .utf8)!, withName: "categories[]")
            }
            print("INIDATA \(multipartFormData)")
        }, to: HttpUtility.endpoint + "profile/update", method: .post , headers: headers)
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
                        if code >= 200 && code < 300 {
                            let campaignResponse = try? JSONDecoder().decode(UpdateInfluencerProfileResponse.self, from: response.value as! Data)
                            print(campaignResponse)
                            //print(res)
                            self.isFinishedUpload = true
                        } else {
                            let campaignResponse = try? JSONDecoder().decode(UpdateInfluencerProfileResponse.self, from: response.value as! Data)
                            print(campaignResponse)
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

extension String {
    var containsWhitespace : Bool {
        return(self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
    var isInt: Bool {
            return Int(self) != nil
        }
}
