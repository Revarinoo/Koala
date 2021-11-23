//
//  OnboardViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 22/10/21.
//

import Foundation

class OnboardViewModel: ObservableObject {
    
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
