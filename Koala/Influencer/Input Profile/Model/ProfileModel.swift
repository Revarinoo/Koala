//
//  ProfileModel.swift
//  Koala
//
//  Created by Sholihatul Richas on 23/11/21.
//

import Foundation



enum locationProvince: String, CaseIterable, Equatable{
    case aceh = "Aceh"
    case bengkulu = "Bengkulu"
    case banten = "Banten"
    case bali = "Bali"
    case yogyakarta = "DI Yogyakarta"
    case dkijakarta = "DKI Jakarta"
    case gorontalo = "Gorontalo"
    case jambi = "Jambi"
    case jawabarat = "Jawa Barat"
}

class InfluencerSpecialty: ObservableObject {
    
    @Published var interest: [ClickedFilterModel] = [
        ClickedFilterModel(name: "Asian", isClicked: false),
        ClickedFilterModel(name: "Coffee", isClicked: false),
        ClickedFilterModel(name: "Dessert", isClicked: false),
        ClickedFilterModel(name: "Drinks", isClicked: false),
        ClickedFilterModel(name: "Fast Food", isClicked: false),
        ClickedFilterModel(name: "Fine Dining", isClicked: false),
        ClickedFilterModel(name: "Healthy", isClicked: false),
        ClickedFilterModel(name: "Snack", isClicked: false),
        ClickedFilterModel(name: "Street", isClicked: false),
        ClickedFilterModel(name: "Traditional", isClicked: false),
        ClickedFilterModel(name: "Vegan", isClicked: false),
        ClickedFilterModel(name: "Vegetarian", isClicked: false),
        ClickedFilterModel(name: "Western", isClicked: false)
    ]
    
    func countSpecialtyClicked() -> Int {
        return self.interest.filter({$0.isClicked == true}).count
    }
    
    func getSpecialtyClicked() -> [String] {
        return self.interest.filter({$0.isClicked == true}).map { $0.name }
    }
}
