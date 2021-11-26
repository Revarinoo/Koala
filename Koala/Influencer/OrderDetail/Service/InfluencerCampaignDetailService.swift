
import Foundation

class InfluencerCampaignDetailService {
    
    func getOrderDetails(id: Int, completionHandler:@escaping(_ result: InfluencerCampaignDetailResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencer/order/detail/\(id)")! as URL)
        
        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerCampaignDetailResponse.self) { response in
            _ = completionHandler(response)
        }
    }
    
    func submitOrderStatus(_ postRequest: InfluencerCampaignStatusRequest, completionHandler:@escaping(_ result: InfluencerCampaignStatusResponse?)->Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencer/campaign/status")! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(postRequest)

        HttpUtility.shared.request(request as URLRequest, resultType: InfluencerCampaignStatusResponse.self) { response in
            completionHandler(response)
        }
    }
}
