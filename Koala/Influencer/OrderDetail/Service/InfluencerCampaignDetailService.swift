
import Foundation

class InfluencerCampaignDetailService {
    
    func getOrderDetails(id: Int, completionHandler:@escaping(_ result: InfluencerCampaignDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencer/order/detail/\(id)")! as URL)
        
        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerCampaignDetailResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}