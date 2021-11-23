//
//  LocationSelectorViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 20/11/21.
//

import Foundation

class LocationSelectorViewModel: ObservableObject {
    
    @Published var locations: [ClickedFilterModel] = [
        ClickedFilterModel(name: "Jakarta Pusat", isClicked: false),
        ClickedFilterModel(name: "Jakarta Utara", isClicked: false),
        ClickedFilterModel(name: "Jakarta Timur", isClicked: false),
        ClickedFilterModel(name: "Jakarta Barat", isClicked: false),
        ClickedFilterModel(name: "Jakarta Selatan", isClicked: false),
        ClickedFilterModel(name: "Tangerang", isClicked: false),
        ClickedFilterModel(name: "Tangerang Selatan", isClicked: false),
        ClickedFilterModel(name: "Surabaya", isClicked: false),
        ClickedFilterModel(name: "Bandung", isClicked: false),
        ClickedFilterModel(name: "Medan", isClicked: false),
        ClickedFilterModel(name: "Yogyakarta", isClicked: false),
        ClickedFilterModel(name: "Bekasi", isClicked: false),
        ClickedFilterModel(name: "Semarang", isClicked: false),
        ClickedFilterModel(name: "Surakarta", isClicked: false),
        ClickedFilterModel(name: "Denpasar", isClicked: false),
        ClickedFilterModel(name: "Makassar", isClicked: false)
    ]
    
    func countLocationClicked() -> Int {
        return self.locations.filter({$0.isClicked == true}).count
    }
    
    func getLocationClicked() -> [String] {
        return self.locations.filter({$0.isClicked == true}).map { $0.name }
    }
}
