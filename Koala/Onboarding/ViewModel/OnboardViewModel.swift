//
//  OnboardViewModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 22/10/21.
//

import Foundation

class OnboardViewModel: ObservableObject {
    
    @Published var interest: [SpecialtyModel] = [
        SpecialtyModel(name: "Asian", isClicked: false),
        SpecialtyModel(name: "Coffee", isClicked: false),
        SpecialtyModel(name: "Dessert", isClicked: false),
        SpecialtyModel(name: "Drinks", isClicked: false),
        SpecialtyModel(name: "Fast Food", isClicked: false),
        SpecialtyModel(name: "Fine Dining", isClicked: false),
        SpecialtyModel(name: "Healthy", isClicked: false),
        SpecialtyModel(name: "Snack", isClicked: false),
        SpecialtyModel(name: "Street", isClicked: false),
        SpecialtyModel(name: "Traditional", isClicked: false),
        SpecialtyModel(name: "Vegan", isClicked: false),
        SpecialtyModel(name: "Vegetarian", isClicked: false),
        SpecialtyModel(name: "Western", isClicked: false)
    ]
    
    func countSpecialtyClicked() -> Int {
        return self.interest.filter({$0.isClicked == true}).count
    }
    
    func getSpecialtyClicked() -> [String] {
        return self.interest.filter({$0.isClicked == true}).map { $0.name }
    }
}