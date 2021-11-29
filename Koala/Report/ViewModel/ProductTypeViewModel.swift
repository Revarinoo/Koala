//
//  ProductTypeViewModel.swift
//  Koala
//
//  Created by Jonathan Clive on 29/11/21.
//

import Foundation

class ProductTypeViewModel: ObservableObject{
    @Published var productTypes : [ProductTypeModel] =
        [ProductTypeModel(name: "Instagram Story"),
         ProductTypeModel(name: "Instagram Post"),
         ProductTypeModel(name: "Instagram Reels")
        ]
}
