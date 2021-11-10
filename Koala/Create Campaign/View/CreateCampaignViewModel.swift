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


let localURLnya = "http://127.0.0.1:8000/api/campaign/detail/create"
let serverURLnya = "http://34.124.208.0/Koala-backend/public/api/campaign/create"

class CreateCampaignViewModel : ObservableObject {
    @AppStorage("JWT", store: .standard) var token = ""
    @Published var createCampaignModel : CreateCampaignModel = CreateCampaignModel()
    private let createCampaignService: CreateCampaignService = CreateCampaignService()
    private var content_id : Int = 0
    @Published var isSuccess = false
    @Published var createContentModel : [CreateContentModel] = [CreateContentModel(contentType: productType.post, contentDetail: "", isDeleted: false)]
    
    func appendCreate(createData: CreateContentModel){
        print(createData)
    }
    
    func submitData(submittedCampaign : CreateCampaignModel, submittedContent: [CreateContentModel]){
        print("ini konten model \(createContentModel)")
        let campaign_logo = submittedCampaign.logo.jpegData(compressionQuality: 0.5) ?? Data()
        var references : [Data] = []
        if submittedCampaign.references.count != 0 {
            for refImage in submittedCampaign.references {
                let refImageData = refImage.pngData()!
                references.append(refImageData)
            }
        }
        let createCampaignReq = CreateCampaignRequest(campaign_logo: campaign_logo, name: submittedCampaign.title, description: submittedCampaign.description, start_date: submittedCampaign.startDate.serverFormattedDate(), end_date: submittedCampaign.endDate.serverFormattedDate(), product_name: submittedCampaign.product, rules: submittedCampaign.rules, references: references)
        print("create campaign: \(createCampaignReq)")

        //let imgData = campaign_logo.jpegData(compressionQuality: 0.5) ?? Data()
        let parameters = [
            "name": createCampaignReq.name,
            "description": createCampaignReq.description,
            "start_date": createCampaignReq.start_date,
            "end_date": createCampaignReq.end_date,
            "product_name": createCampaignReq.product_name,
            "rules": createCampaignReq.rules
        ]
        //        MARK: header buat yg local
        //        let headers: HTTPHeaders = [
        //            "Authorization": "Bearer 1|m537lhpvOSjSVy8crTgJYZQOL6xCC5d0ouxnl3Nn",
        //            "Content-type": "multipart/form-data"
        //        ]

        //      MARK: header buat yg server
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-type": "multipart/form-data"
        ]

        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(campaign_logo, withName: "campaign_logo",fileName: "file.jpeg", mimeType: "image/jpeg")
            for (index, value) in references.enumerated() {
                multipartFormData.append(value, withName: "references[\(index)]",fileName: "\(index).jpeg", mimeType: "image/jpeg")
            }
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to:serverURLnya, method: .post , headers: headers)
        { (result) in
            print(result)
            switch result {
            case .success(let upload, _, _):

                print("Sukses harusnya")

                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })

                upload.responseData { response in
//                    print("response.statusCode")
//                    print(response.response?.statusCode)
//                    print("response.value")
//                    print(response.value)
                    if let code = response.response?.statusCode{
                        if code == 201{
                            let campaignResponse = try? JSONDecoder().decode(CreateCampaignResponse.self, from: response.value as! Data)
                            self.content_id = campaignResponse?.content_id ?? 0
                            self.submitContent()
                            self.isSuccess = true
                            print(self.content_id)
                        }
                    }
                }

            case .failure(let encodingError):
                print("failure")
                print(encodingError)
            }
        }
    }
    func submitContent(){
        var createContent : [CreateCampaignDetail] = []
        //print("ini koneten \(self.createContentModel)")
        for content in self.createContentModel{
            if !content.isDeleted {
                createContent.append(CreateCampaignDetail(content_id: self.content_id, content_type: content.contentType.rawValue, instruction: content.contentDetail))
            }
            //print("ini koneten \(createContent)")
            for content in createContent{
                createCampaignService.postCreateCampaign(content){ response in
                    DispatchQueue.main.async {
                        if let code = response?.code{
                                print(response)
                        }
                    }
                }
            }
            
        }
    }
}

extension Date {
    func serverFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        return dateformat.string(from: self)
    }
}

//3|SZWRWydfBtOsl4I0s1vyvXWLKFtrMPCVmJcBqy3e
