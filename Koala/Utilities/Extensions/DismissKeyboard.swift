//
//  DismissKeyboard.swift
//  Koala
//
//  Created by Sholihatul Richas on 10/11/21.
//

import SwiftUI

extension View {
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
