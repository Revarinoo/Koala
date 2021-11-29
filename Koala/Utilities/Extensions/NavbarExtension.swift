//
//  NavbarExtension.swift
//  Koala
//
//  Created by Revarino Putra on 29/11/21.
//

import Foundation
import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        var scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        var standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = UIColor(ThemeColor.background)
        
        //var
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        navigationBar.standardAppearance = standardAppearance
        navigationBar.tintColor = UIColor(ThemeColor.primary)
    }
}
