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
         //Categories(categoryName: "Dessert", categoryImage: "dessert"),
         Categories(categoryName: "Healthy", categoryImage: "healthy"),
         Categories(categoryName: "Western", categoryImage: "western"),
         Categories(categoryName: "Traditional", categoryImage: "traditional"),
         Categories(categoryName: "Fine Dining", categoryImage: "finedining"),
         Categories(categoryName: "Snack", categoryImage: "snack"),
         Categories(categoryName: "Asian", categoryImage: "asian"),
         Categories(categoryName: "Drinks", categoryImage: "drinks"),
         Categories(categoryName: "Fat Food", categoryImage: "fastfood"),
         Categories(categoryName: "Vegetarian", categoryImage: "vegetarian"),
         Categories(categoryName: "Vegan", categoryImage: "vegan")
        ]
}

//subscribe nilai category
//and the show the category
