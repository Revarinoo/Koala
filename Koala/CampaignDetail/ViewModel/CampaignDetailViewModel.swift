//
//  CampaignDetailViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 02/11/21.
//

import Foundation

class CampaignDetailViewModel: ObservableObject {
    
    @Published var campaignTasks: [CampaignDetailModel] = []
    private let campaignDetailService: CampaignDetailService = CampaignDetailService()
    
    func callGetCampaignDetail(_ id: Int) {
        var tasks: [CampaignDetailModel] = []
        campaignDetailService.getCampaignDetail(id) { response in
            if let code = response?.code {
                if code == 201, let responseData = response?.data {
                    for task in responseData {
                        let contentId = task.content_id ?? 0
                        let contentType = task.content_type ?? ""
                        let instruction = task.instruction ?? ""
                        
                        let singleTask = CampaignDetailModel(contentId: contentId, contentType: contentType, instruction: instruction )
                        
                        tasks.append(singleTask)
                    }
                }
                
                DispatchQueue.main.async {
                    self.campaignTasks = tasks
                }
            }
        }
    }
}
