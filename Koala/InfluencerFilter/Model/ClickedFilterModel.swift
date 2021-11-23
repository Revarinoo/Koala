//
//  SpecialtyModel.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 22/10/21.
//

import Foundation

struct ClickedFilterModel: Identifiable {
    let id = UUID()
    let name: String
    var isClicked: Bool
}
