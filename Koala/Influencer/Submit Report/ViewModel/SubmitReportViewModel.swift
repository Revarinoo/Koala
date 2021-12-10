//
//  SubmitReportViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import Foundation
import SDWebImage
import Alamofire
import SwiftUI

enum ContentType: CaseIterable {
    case Post
    case Story
    case Reels
}

struct ContentStorage {
    let type: ContentType
    let orderDetailId: Int
}

class SubmitReportViewModel: ObservableObject {
    @AppStorage("JWT", store: .standard) var token = ""
    @Published var igPost: PostModel = PostModel()
    @Published var igStory: StoryModel = StoryModel()
    @Published var igReels: ReelsModel = ReelsModel()
    @Published var contents: [ContentStorage] = []
    @Published var isSucceed: Bool = false
    
    private var post_photo: String = ""
    
    private let service = SubmitReportService()
    private let igThumbnailFetcher: ThumbnailImageFetcher = ThumbnailImageFetcher()
    
    func submit() {
        for content in contents {
            switch content.type {
            case .Post:
                igThumbnailFetcher.fetchInfo(igPost.link) { [unowned self] result in
                    
                    switch result {
                    case .success(let media):
                        
                        self.post_photo = media.images.thumbnail
                        
                        let downloader = SDWebImageManager()
                        downloadImage(self.post_photo ) { image in
                            guard let image = image else { return }

                            // use image here
                            let imgData = Data(image.jpegData(compressionQuality: 1)! ?? Data())
                            let defaultImage = UIImage(named: "defaultCampaign")!.jpegData(compressionQuality: 0.5)
                            var imageSize: Int = imgData.count
                            print("actual size of image in KB: %f ", Double(imageSize) / 1000.0)
                            
                            let submitReportReq = ReportRequest(post_url: self.igPost.link, views: nil, likes: self.igPost.likes, comments: self.igPost.comments, reach: nil, impressions: nil, post_photo: imgData as Data ,order_detail_id: content.orderDetailId)
                            
                            let parameters = [
                                "post_url": submitReportReq.post_url ?? "",
                                "views": submitReportReq.views ?? 0,
                                "likes": submitReportReq.likes ?? 0,
                                "comments": submitReportReq.comments ?? 0,
                                "impressions": submitReportReq.impressions ?? 0,
                                "reach": submitReportReq.reach ?? 0,
                                "order_detail_id": submitReportReq.order_detail_id
                            ] as [String : Any]
                            
                            //      MARK: header buat yg server
                            let headers: HTTPHeaders = [
                                "Authorization": "Bearer \(token)",
                                "Content-type": "multipart/form-data"
                            ]
                            
                            Alamofire.upload(multipartFormData: { multipartFormData in
                                multipartFormData.append((imgData ?? defaultImage) ?? Data(), withName: "post_photo",fileName: "file.jpeg", mimeType: "image/jpeg")
                                
                                for (key, value) in parameters {
                                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                                }
                            }, to:serverURLnya, method: .post , headers: headers)
                            { (result) in
                                print(result)
                                switch result {
                                case .success(let upload, _, _):
                                    
                                    upload.uploadProgress(closure: { (progress) in
                                        print("Upload Progress: \(progress.fractionCompleted)")
                                        if progress.fractionCompleted == 1.0 {
                                            
                                        }
                                    })
                                    
                                    upload.responseData { response in
                                        if let code = response.response?.statusCode{
                                            print("KODE s \(code)")
                                            if code == 201 {
                                                DispatchQueue.main.async {
                                                    self.isSucceed = true
                                                }
                                            } else {
                                                self.isSucceed = false
                                            }
                                        }
                                    }
                                    
                                case .failure(let encodingError):
                                    print("failure!!!!")
                                    print(encodingError)
                                }
                            }
                        }
                        
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                    }
                }
                
            case .Story:
                service.submitReport(requestBody: ReportRequest(post_url: nil, views: igStory.views, likes: nil, comments: nil, reach: igStory.reach, impressions: igStory.impression, post_photo: nil ,order_detail_id: content.orderDetailId)) { result in
                    if let response = result {
                        if response.code == 201 {
                            DispatchQueue.main.async {
                                self.isSucceed = true
                            }
                        }
                    }
                }
                
            case .Reels:
                
                igThumbnailFetcher.fetchInfo(igPost.link) { [unowned self] result in
                    
                    switch result {
                    case .success(let media):
                        
                        self.post_photo = media.images.thumbnail
                        print("self.post_photo")
                        print(self.post_photo)
                        
                        let downloader = SDWebImageManager()
                        downloadImage(self.post_photo ) { image in
                            guard let image = image else { return }

                            // use image here
                            let imgData = Data(image.jpegData(compressionQuality: 1)! )
                            let defaultImage = UIImage(named: "defaultCampaign")!.jpegData(compressionQuality: 0.5)
                            var imageSize: Int = imgData.count
                            print("actual size of image in KB: %f ", Double(imageSize) / 1000.0)
                            
                            let submitReportReq = ReportRequest(post_url: igReels.link, views: igReels.views, likes: igReels.likes, comments: igReels.comments, reach: nil, impressions: nil, post_photo: imgData as Data ,order_detail_id: content.orderDetailId)
                            
                            let parameters = [
                                "post_url": submitReportReq.post_url ?? "",
                                "views": submitReportReq.views ?? 0,
                                "likes": submitReportReq.likes ?? 0,
                                "comments": submitReportReq.comments ?? 0,
                                "impressions": submitReportReq.impressions ?? 0,
                                "reach": submitReportReq.reach ?? 0,
                                "order_detail_id": submitReportReq.order_detail_id
                            ] as [String : Any]
                            
                            //      MARK: header buat yg server
                            let headers: HTTPHeaders = [
                                "Authorization": "Bearer \(token)",
                                "Content-type": "multipart/form-data"
                            ]
                            
                            Alamofire.upload(multipartFormData: { multipartFormData in
                                multipartFormData.append((imgData ?? defaultImage) ?? Data(), withName: "post_photo",fileName: "file.jpeg", mimeType: "image/jpeg")
                                
                                for (key, value) in parameters {
                                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                                }
                            }, to:serverURLnya, method: .post , headers: headers)
                            { (result) in
                                print(result)
                                switch result {
                                case .success(let upload, _, _):
                                    
                                    upload.uploadProgress(closure: { (progress) in
                                        print("Upload Progress: \(progress.fractionCompleted)")
                                        if progress.fractionCompleted == 1.0 {
                                            
                                        }
                                    })
                                    
                                    upload.responseData { response in
                                        if let code = response.response?.statusCode{
                                            print("KODE s \(code)")
                                            if code == 201 {
                                                DispatchQueue.main.async {
                                                    self.isSucceed = true
                                                }
                                            } else {
                                                self.isSucceed = false
                                            }
                                        }
                                    }
                                    
                                case .failure(let encodingError):
                                    print("failure!!!!")
                                    print(encodingError)
                                }
                            }
                        }
                        
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                    }
                }
            default:
                isSucceed = false
            }
        }
    }
    
    func downloadImage(_ urlString: String, completion: @escaping(UIImage?) -> Void) {
        let url = URL(string: urlString)!

        SDWebImageDownloader.shared.downloadImage(with: url) { image, _, _, _ in
            completion(image)
        }
    }
    
}
