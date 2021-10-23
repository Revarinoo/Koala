//
//  File.swift
//  Koala
//
//  Created by Sholihatul Richas on 21/10/21.
//

import Foundation
import Combine

class CategoryViewModel: ObservableObject{
    @Published var categories : [Categories] =
        [Categories(categoryName: "Coffee", categoryImage: "coffee"),
         Categories(categoryName: "Street Food", categoryImage: "street"),
         Categories(categoryName: "Bakery", categoryImage: "bakery"),
         Categories(categoryName: "Dessert", categoryImage: "dessert"),
         Categories(categoryName: "Healthy", categoryImage: "healthy")]
}

//subscribe nilai category
//and the show the category
