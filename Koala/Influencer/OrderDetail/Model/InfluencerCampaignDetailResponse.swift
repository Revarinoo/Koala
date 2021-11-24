
import Foundation

struct InfluencerCampaignDetailResponse: Codable {
    let campaign: CampaignContentModel
    let campaign_details: [CampaignContentDetailModel]
    let references: [String]
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
}

struct CampaignContentDetailModel: Codable {
    let content_type: String?
    let instruction: String?
}