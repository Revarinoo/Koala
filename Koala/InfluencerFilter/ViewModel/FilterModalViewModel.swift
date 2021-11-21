//
//  FilterModalViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 20/11/21.
//

import Foundation

class FilterModalViewModel: ObservableObject {
    
    @Published var location: [String] = []
    @Published var specialties: [String] = []
    @Published var minPrice: Int = 0
    @Published var maxPrice: Int = 10000000
    @Published var engagementRate: Double = 0.0
    @Published var rating: Int = 0
    
    func getFormattedFilters() -> [String] {
        var filters: [String] = location + specialties
        
        let priceFormat = minPrice != 0  ? "IDR \(minPrice.thousandsFormatter()) - IDR \(maxPrice.thousandsFormatter())" : ""
        filters.append(priceFormat)
        
        let engagementRateFormat = engagementRate != 0 ? "ER≥\(engagementRate.oneDecimalFormatter)%" : ""
        filters.append(engagementRateFormat)
        
        let ratingFormat = rating != 0 ? "★≥\(Double(rating).oneDecimalFormatter)" : ""
        filters.append(ratingFormat)
        
        return filters.filter({ $0 != "" })
    }
    
    func resetFilters() {
        specialties = []
        minPrice = 0
        maxPrice = 10000000
        engagementRate = 0.0
        rating = 0
    }
}
