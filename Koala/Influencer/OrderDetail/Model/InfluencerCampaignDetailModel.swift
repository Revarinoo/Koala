
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
}

struct InfluencerCampaignDetailContentModel: Identifiable {
    var id = UUID()
    var content_type: String = ""
    var content_detail: String = ""
}
