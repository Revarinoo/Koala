//
//  ArrayExtension.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 20/11/21.
//

import Foundation

extension Array where Element: Equatable {
    func contains(array: [Element]) -> Bool {
        for item in array {
            if !self.contains(item) { return false }
        }
        return true
    }
}
