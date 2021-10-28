//
//  ReviewViewModel.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import Foundation
import Combine

class ReviewViewModel: ObservableObject{
    @Published var reviews : [Review] =
        [Review(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Aries Lasso", message: "Amazing Work! In accordance to brief.", rating: 4),
         Review(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Daniella H", message: "Creative Content and amazing result of brand awareness.", rating: 5),
         Review(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Evory U", message: "Thank you! Satisfied with the work and worth the price.", rating: 4),
         Review(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Megan Fax", message: "Very coordinative with such an affordable price!", rating: 5),
         Review(userImage: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Reva Rino", message: "Love it! Worth every penny!", rating: 5)]
}
