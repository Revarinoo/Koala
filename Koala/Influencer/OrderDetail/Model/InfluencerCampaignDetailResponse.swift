
import Foundation

struct InfluencerCampaignDetailResponse: Codable {
    let campaign: CampaignContentModel
    let campaign_details: [CampaignContentDetailModel]
    let order_detail: [CampaignPriceModel]
    let references: [String]
    let business_photo: String?
    let business_name: String
    let message: String
    let code: Int
}

struct CampaignContentModel: Codable {
    let name: String?
    let description: String?
    let end_date: String?
    let product_name: String?
    let rules: String?
    let campaign_logo: String?
    let business: BusinessCampaign
}

struct CampaignContentDetailModel: Codable {
    let order_detail_id: Int?
    let content_type: String?
    let instruction: String?
}

struct CampaignPriceModel: Codable {
    let price: Int?
}

struct BusinessCampaign: Codable {
    let user_id: Int?
}
