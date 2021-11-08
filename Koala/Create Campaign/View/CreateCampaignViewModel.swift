//
//  CreateCampaignViewModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 07/11/21.
//

import Foundation
import Alamofire
import UIKit
import SwiftUI

class CreateCampaignViewModel : ObservableObject {
    @Published var createCampaignModel : CreateCampaignModel = CreateCampaignModel()
    private let createCampaignService: CreateCampaignService = CreateCampaignService()
    
    func submitData(submittedCampaign : CreateCampaignModel){
        let campaign_logo = submittedCampaign.logo.pngData()
        var references : [Data] = []
        if submittedCampaign.references.count != 0 {
            for refImage in submittedCampaign.references {
                let refImageData = refImage.pngData()!
                references.append(refImageData)
            }
        }
        let createCampaignReq = CreateCampaignRequest(campaign_logo: campaign_logo, name: submittedCampaign.title, description: submittedCampaign.description, schedule: submittedCampaign.dueDate.serverFormattedDate(), product_name: submittedCampaign.product, rules: submittedCampaign.rules, references: references)
        createCampaignService.postCreateCampaign(createCampaignReq){
            response in DispatchQueue.main.async {
                if let code = response?.code, let message = response?.message {
                    if code == 201 {
                        //self.loginModel.navigate = true
                        //self.token = token
                    }
                    else {
                        //self.loginModel.errorMessage = message
                        //self.loginModel.isPresentingErrorAlert = true
                    }
                }
            }
        }
    }
    func callPostCampaign(instruction: String, schedule: Date, image: UIImage) {
        
        let imgData = image.jpegData(compressionQuality: 0.5) ?? Data()
        let parameters = [
            "instruction": "\(instruction)",
            "schedule": "\(schedule.serverFormattedDate())",
            "business_id": "1"
        ]
        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        AF.upload(multipartFormData: {
            multipartFormData in
            multipartFormData.append(imgData, withName: "image",fileName: "file.jpeg", mimeType: "image/jpeg")
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: "http:127.0.0.1:8000/api/create-campaign", method: .post , headers: headers)
        //        { (result) in
        //            switch result {
        //            case .success (let value):
        //
        //                upload.uploadProgress(closure: { (progress) in
        //                    print("Upload Progress: \(progress.fractionCompleted)")
        //                })
        //
        //                upload.responseJSON { response in
        //                    print("response.statusCode")
        //                    print(response.response?.statusCode)
        //                    print("response.value")
        //                    print(response.value)
        //                }
        //
        //            //case .failure(let encodingError):
        //            //    print("failure")
        //            //    print(encodingError)
        //            }
        //        }
    }
}

extension Date {
    func serverFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        return dateformat.string(from: self)
    }
}
