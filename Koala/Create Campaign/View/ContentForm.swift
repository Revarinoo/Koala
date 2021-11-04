//
//  ContentForm.swift
//  Koala
//
//  Created by Sholihatul Richas on 04/11/21.
//

import SwiftUI

struct ContentForm: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var productTypee : productType = .post
    @State var contentDetail = ""
    
    let tipPecentages = [10, 15, 20, 25, 0]
    
    init(){
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ThemeColor.primary)
        UISegmentedControl.appearance().backgroundColor = UIColor(ThemeColor.background)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        UINavigationBar.appearance().backgroundColor = UIColor(ThemeColor.background)
        UIPickerView.appearance().backgroundColor = UIColor(ThemeColor.primary)
    }
    
    var body: some View {
        VStack{
            if #available(iOS 15.0, *) {
                HStack{
                    Picker("Number of people", selection: $productTypee) {
                        ForEach(productType.allCases, id: \.self) { value in
                            Text("\(value.rawValue)").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
                        }
                    }.font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray).accentColor(ThemeColor.primary).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                }
            } else {
                // Fallback on earlier versions
            }
            VStack(alignment: .leading, spacing: 6){
                Text("Product")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                    .foregroundColor(ThemeColor.grayDark)
                TextEditor(text: $contentDetail)
                    .colorMultiply(.white).frame(height: 172).cornerRadius(10)
            }.padding(.horizontal, 16).padding(.bottom, 25)
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.945, blue: 0.929)/*@END_MENU_TOKEN@*/).cornerRadius(10)
        
        
    }
}

struct ContentForm_Previews: PreviewProvider {
    static var previews: some View {
        ContentForm()
    }
}
