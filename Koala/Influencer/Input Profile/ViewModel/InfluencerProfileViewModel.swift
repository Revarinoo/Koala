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
    
    func validateInput(){
        
    }
    
    func submitProfileData(_ data: UpdateProfileModel){
        let defaultImage = UIImage(named: "defaultCampaign")!.jpegData(compressionQuality: 0.5)
        let profileImage = data.image.jpegData(compressionQuality: 0.5) ?? defaultImage
        let parameters =
        [
            "type_role" : data.typeRole,
            "name": data.name,
            "location" : data.location.rawValue,
            "categories" : data.categories,
            "email" : data.email,
            "post_min_rate" : Int(data.postMin) ?? 0,
            "post_max_rate" : Int(data.postMax) ?? 0,
            "story_min_rate" : Int(data.storyMin) ?? 0,
            "story_max_rate" : Int(data.storyMax) ?? 0,
            "reels_min_rete" : Int(data.reelsMin) ?? 0,
            "reels_max_rate" : Int(data.reelsMax) ?? 0,
            "socialmeida_id" : data.socialMedia
        ]
//
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 2|740IuKwaXPyxF6iYUQ4j7g29ub5f7X2sWofm3nUY",
            "Content-type": "multipart/form-data"
        ]
        
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append((profileImage ?? defaultImage) ?? Data(), withName: "profile",fileName: "\(data.name).jpeg", mimeType: "image/jpeg")
//            
////            for (key, value) in updateProfileRequest {
////                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
////
////                                }
//            for (key, value) in parameters {
//                        if let temp = value as? String {
//                            multipartFormData.append(temp.data(using: .utf8)!, withName: key)
//                        }
//                        if let temp = value as? Int {
//                            multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
//                        }
//                        if let temp = value as? NSArray {
//                            temp.forEach({ element in
//                                let keyObj = key + "[]"
//                                if let string = element as? String {
//                                    multipartFormData.append(string.data(using: .utf8)!, withName: keyObj)
//                                } else
//                                    if let num = element as? Int {
//                                        let value = "\(num)"
//                                        multipartFormData.append(value.data(using: .utf8)!, withName: keyObj)
//                                }
//                            })
//                        }
//                    }
//        }, to: "http://127.0.0.1:8000/api/profile/update", method: .post , headers: headers)
//        { (result) in
//            print(result)
//            switch result {
//            case .success(let upload, _, _):
//                
//                upload.uploadProgress(closure: { (progress) in
//                    if progress.fractionCompleted == 1.0 {
//                        
//                    }
//                })
//                
//                upload.responseData { response in
//                    if let code = response.response?.statusCode{
//                        print("KODE \(code)")
//                        if code == 201 {
//                            let campaignResponse = try? JSONDecoder().decode(UpdateInfluencerProfileResponse.self, from: response.value as! Data)
//                        } else {
//                        }
//                    }
//                }
//                
//            case .failure(let encodingError):
//                print("failure!!!!")
//                print(encodingError)
//            }
//        }
        
    }
}
