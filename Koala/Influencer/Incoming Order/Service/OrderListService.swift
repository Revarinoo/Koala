//
//  OrderListService.swift
//  Koala
//
//  Created by Revarino Putra on 22/11/21.
//

import Foundation
import SwiftUI

class OrderListService {
    @AppStorage("JWT", store: .standard) var token = ""
    
    func getOrderList(completionHandler: @escaping(_ result: OrderListResponse?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: HttpUtility.endpoint + "influencer/order/list")! as URL)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        HttpUtility.shared.request(request as URLRequest, resultType: OrderListResponse.self) { response in
            _ = completionHandler(response)
        }
    }
}
