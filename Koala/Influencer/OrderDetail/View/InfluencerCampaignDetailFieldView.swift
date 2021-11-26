
import SwiftUI
import SDWebImageSwiftUI

struct InfluencerCampaignDetailFieldView: View {
    
    var campaign: InfluencerCampaignDetailModel
    var campaignDetail: [InfluencerCampaignDetailContentModel]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 18) {
            DetailField(title: "Campaign Title", data: campaign.campaign_title, font: ThemeFont.poppinsRegular, fontSize: 16)
            DetailField(title: "Due Date", data: campaign.due_date, font: ThemeFont.poppinsRegular, fontSize: 16)
            DetailField(title: "Product", data: campaign.product, font: ThemeFont.poppinsRegular, fontSize: 16)
            DetailField(title: "Description", data: campaign.description, font: ThemeFont.poppinsMedium, fontSize: 12)
            DetailField(title: "Rules", data: campaign.rules, font: ThemeFont.poppinsMedium, fontSize: 12)
            
            images
            
            ForEach(campaignDetail, id: \.id) { detail in
                DetailField(title: "Content Type", data: detail.content_type, font: ThemeFont.poppinsRegular, fontSize: 16)
                DetailField(title: "Content Detail", data: detail.content_detail, font: ThemeFont.poppinsMedium, fontSize: 12)
            }
        }
    }
    
    var images: some View {
        VStack (alignment: .leading, spacing: 6) {
            Text("References")
                .font(.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(Color.init(hex: "A7A7A7"))
            ScrollView (.horizontal, showsIndicators: false) {
                ForEach(campaign.references, id: \.self) { reference in
                    HStack {
                        WebImage(url: URL(string: reference))
                            .resizable()
                            .clipped()
                            .frame(width: 82, height: 93.09)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}