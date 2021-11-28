
import Foundation

class InfluencerCampaignDetailViewModel: ObservableObject {
    
    static let shared = InfluencerCampaignDetailViewModel()
    @Published var campaignModel = InfluencerCampaignDetailModel()
    @Published var campaignDetailModel: [InfluencerCampaignDetailContentModel] = []
    @Published var campaignPriceModel: [InfluencerCampaignPriceModel] = []
    private var influencerCampaignService = InfluencerCampaignDetailService()
    @Published var targetUserId: Int = 0
    
    func getOrderDetails(id: Int) {
        influencerCampaignService.getOrderDetails(id: id) { result in
            if let campaign_logo = result?.campaign.campaign_logo, let campaign_title = result?.campaign.name, let due_date = result?.campaign.end_date, let product = result?.campaign.product_name, let description = result?.campaign.description, let rules = result?.campaign.rules, let references = result?.references, let details = result?.campaign_details, let business_photo = result?.business_photo, let business_name = result?.business_name, let prices = result?.order_detail, let targetId = result?.campaign.business.user_id {
                
                var campaignDetails: [InfluencerCampaignDetailContentModel] = []
                var campaignPrices: [InfluencerCampaignPriceModel] = []
                
                DispatchQueue.main.async {
                    self.campaignModel.campaign_logo = campaign_logo
                    self.campaignModel.campaign_title = campaign_title
                    self.campaignModel.due_date = due_date
                    self.campaignModel.product = product
                    self.campaignModel.description = description
                    self.campaignModel.rules = rules
                    self.campaignModel.references = references
                    self.campaignModel.business_photo = business_photo
                    self.campaignModel.business_name = business_name
                    self.targetUserId = targetId
                }
                
                for (index, detail) in details.enumerated() {
                    let order_detail_id = detail.order_detail_id ?? 0
                    let content_type = detail.content_type ?? ""
                    let instruction = detail.instruction ?? ""
                    let price = prices.map{ $0.price }[index] ?? 0
                    let singleDetail = InfluencerCampaignDetailContentModel(order_detail_id: order_detail_id, content_type: content_type, content_detail: instruction)
                    let singlePrice = InfluencerCampaignPriceModel(order_detail_id: order_detail_id, price: price, content_type: content_type)
                    
                    campaignDetails.append(singleDetail)
                    campaignPrices.append(singlePrice)
                }
                
                DispatchQueue.main.async {
                    self.campaignDetailModel = campaignDetails
                    self.campaignPriceModel = campaignPrices
                }
            }
        }
    }
    
    func submitCampaignStatus(_ id: Int, status: String) {
        let campaignStatus = InfluencerCampaignStatusRequest(order_id: id, status: status)
        influencerCampaignService.submitOrderStatus(campaignStatus) { response in
            DispatchQueue.main.async {
                if let code = response?.code, let message = response?.message {
                    if code == 201 {
                        self.campaignModel.isPresentingStatusAlert = true
                        self.campaignModel.alertTitle = "Success"
                        self.campaignModel.alertMessage = message
                    }
                    else {
                        self.campaignModel.isPresentingStatusAlert = true
                        self.campaignModel.alertTitle = "Failed"
                        self.campaignModel.alertMessage = message
                    }
                }
            }
        }
    }
}
