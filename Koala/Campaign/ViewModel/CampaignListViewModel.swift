//
//  CampaignListViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 27/10/21.
//

import Foundation

class CampaignListViewModel: ObservableObject {
    @Published var campaignLists : [Campaign] =
        [Campaign(campaignPhoto: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", campaignName: "11 Nov Campaign", campaignPackage: "1x Instagram Post & Story", campaignDate: Date(), campaignPrice: 1500000),
         Campaign(campaignPhoto: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", campaignName: "12 Des Campaign", campaignPackage: "1x Instagram Post", campaignDate: Date().addingTimeInterval(86400*31), campaignPrice: 1000000),
         Campaign(campaignPhoto: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", campaignName: "10 Oct Campaign", campaignPackage: "1x Instagram Story", campaignDate: Date().addingTimeInterval(-86400*31), campaignPrice: 500000),
         Campaign(campaignPhoto: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", campaignName: "9 Sep Campaign", campaignPackage: "1x Instagram Post & Story", campaignDate: Date().addingTimeInterval(-2*86400*31), campaignPrice: 1500000)]
}
