//
//  BusinessProfileViewModel.swift
//  Koala
//
//  Created by Clara Anggraini on 27/11/21.
//

import Foundation
import SwiftUI
import Alamofire

class BusinessProfileViewModel: ObservableObject{
    
    @AppStorage("JWT", store: .standard) var token = ""
    @Published var inputBusinessProfileModel = InputBusinessProfileModel()
    @Published var businessProfileModel = BusinessProfileModel()
    @Published var dataError = false
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    @Published var isFinishedUpload = false
    private let businessProfileService: BusinessProfileService = BusinessProfileService()
    
    func validateInput(){
        
        if inputBusinessProfileModel.business_name == "" || inputBusinessProfileModel.website == "" || inputBusinessProfileModel.instagram == "" || inputBusinessProfileModel.location == locationProvince.defaultValue || inputBusinessProfileModel.description == "" {
            self.errorTitle = "Data is Not Complete"
            self.errorMessage = "Make sure to fill out all the form."
            self.dataError = true
            return
        }
        
        if inputBusinessProfileModel.business_photo.size.width == 0 {
            self.errorTitle = "Data is Not Complete"
            self.errorMessage = "Please input your profile photo."
            self.dataError = true
            return
        }
        
        guard let unwrappedInstagram = inputBusinessProfileModel.instagram else {return}
        if unwrappedInstagram.containsWhitespace{
            self.errorTitle = "Wrong Format"
            self.errorMessage = "Make sure your Instagram account contains no space."
            self.dataError = true
            return
        }
        
        if !verifyUrl(urlString: inputBusinessProfileModel.website){
            self.errorTitle = "Wrong Format"
            self.errorMessage = "Make sure your website link can be accessed."
            self.dataError = true
            return
        }
        
        submitProfileData(inputBusinessProfileModel)
        
    }
    
    func verifyUrl(urlString: String?) -> Bool {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return false
        }

        return UIApplication.shared.canOpenURL(url)
    }
    
    func submitProfileData(_ data: InputBusinessProfileModel){
        let defaultImage = UIImage(named: "defaultCampaign")!.jpegData(compressionQuality: 0.5)
        let profileImage = data.business_photo.jpegData(compressionQuality: 0.5) ?? defaultImage
        
        let parameters : [String : String?] =
        [
            "type_role" : "Business",
            "business_name": data.business_name,
            "location" : data.location.rawValue,
            "instagram" : data.instagram,
            "website": data.website,
            "description": data.description
        ]

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append((profileImage ?? defaultImage) ?? Data(), withName: "image",fileName: "\(data.instagram).jpeg", mimeType: "image/jpeg")
            
            for (key, value) in parameters {
                        if let temp = value as? String {
                            multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                        }
                        if let temp = value as? Int {
                            multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                        }
                    }
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
                        if code >= 200 && code < 300 {
                            
                            self.isFinishedUpload = true
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
    
    func getBusinessProfile(){
        
        var profile: BusinessProfileModel?
        businessProfileService.getBusinessProfile(completionHandler: { response in
            if let response = response{
                if response.code == 201{
                    profile = BusinessProfileModel(business_photo: response.business_photo, business_name: response.business_name, instagram: response.instagram, location: response.location, website: response.website, description: response.description)
                }
                
                DispatchQueue.main.async {
                    guard let profile = profile else {return}
                    self.businessProfileModel = profile
                }
            }

        })
            
    }
}
