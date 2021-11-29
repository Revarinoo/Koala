
import Foundation

struct InfluencerCampaignDetailModel: Identifiable {
    var id = UUID()
    var campaign_logo: String = ""
    var campaign_title: String = ""
    var due_date: String = ""
    var product: String = ""
    var description: String = ""
    var rules: String = ""
    var references: [String] = [""]
    var business_photo: String = ""
    var business_name: String = ""
    var isPresentingStatusAlert: Bool = false
    var alertTitle: String = ""
    var alertMessage: String = ""
}

struct InfluencerCampaignDetailContentModel: Identifiable {
    var id = UUID()
    var order_detail_id: Int = 0
    var content_type: String = ""
    var content_detail: String = ""
}

struct InfluencerCampaignPriceModel: Identifiable {
    var id = UUID()
    var order_detail_id: Int = 0
    var price: Int = 0
    var content_type: String = ""
}
