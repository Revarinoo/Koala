
import Foundation

class InfluencerCampaignDetailViewModel: ObservableObject {

    @Published var campaignModel = InfluencerCampaignDetailModel(campaign_logo: "", campaign_title: "", due_date: "", product: "", description: "", rules: "", references: [""])
    @Published var campaignDetailModel: [InfluencerCampaignDetailContentModel] = []
    private var influencerCampaignService = InfluencerCampaignDetailService()
    
    func getOrderDetails(id: Int) {
        influencerCampaignService.getOrderDetails(id: id) { result in
            if let campaign_logo = result?.campaign.campaign_logo, let campaign_title = result?.campaign.name, let due_date = result?.campaign.end_date, let product = result?.campaign.product_name, let description = result?.campaign.description, let rules = result?.campaign.rules, let references = result?.references, let details = result?.campaign_details {
                
                var campaignDetails: [InfluencerCampaignDetailContentModel] = []
                
                DispatchQueue.main.async {
                    self.campaignModel.campaign_logo = campaign_logo
                    self.campaignModel.campaign_title = campaign_title
                    self.campaignModel.due_date = due_date
                    self.campaignModel.product = product
                    self.campaignModel.description = description
                    self.campaignModel.rules = rules
                    self.campaignModel.references = references
                }
                
                for detail in details {
                    let content_type = detail.content_type ?? ""
                    let instruction = detail.instruction ?? ""
                    let singleDetail = InfluencerCampaignDetailContentModel(content_type: content_type, content_detail: instruction)
                    campaignDetails.append(singleDetail)
                }
                DispatchQueue.main.async {
                    self.campaignDetailModel = campaignDetails
                }
            }
        }
    }
}
