//
//  OrderView.swift
//  Koala
//
//  Created by Sholihatul Richas on 26/10/21.
//

import SwiftUI

struct OrderView: View {
    @State private var favoriteColor = 0
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .reserved)
    }
    var body: some View {
        NavigationView{
            Picker("What is your favorite color?", selection: $favoriteColor) {
                Text("Ongoing").tag(0).font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                Text("Completed").tag(1).font(Font.custom(ThemeFont.poppinsMedium, size: 12))
            }
            .pickerStyle(SegmentedPickerStyle())
            .foregroundColor(ThemeColor.primary)
            .padding([.leading, .trailing], 16)
        }.navigationTitle(Text("My Orders").foregroundColor(.blue))
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
