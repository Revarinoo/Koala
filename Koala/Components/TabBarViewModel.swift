//
//  TabBarViewModel.swift
//  Koala
//
//  Created by Revarino Putra on 15/11/21.
//

import Foundation

class TabBarViewModel: ObservableObject {
    static let shared = TabBarViewModel()
    @Published var selectedTab = 0
}
