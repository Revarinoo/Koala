//
//  SpecialtySelector.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct SpecialtySelector: View {
    
    @StateObject var specialtyVM = SpecialtyViewModel()
    @Binding var specialties: [String]
    var phoneWidth = UIScreen.main.bounds.width
    let columns = [
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130)),
        GridItem(.flexible(minimum: 115, maximum: 130))
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Specialty")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                Spacer()
            }
            LazyVGrid(columns: columns) {
                ForEach(specialtyVM.specialties.indices) { index in
                    Button(action: {
                        if specialtyVM.countSpecialtyClicked() < 3 || specialtyVM.specialties[index].isClicked == true {
                            specialtyVM.specialties[index].isClicked.toggle()
                        }
                        self.specialties = specialtyVM.getSpecialtyClicked()
                        print(self.specialties)
                    }, label: {
                        Text(specialtyVM.specialties[index].name)
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                            .padding(.vertical, 4)
                            .frame(minWidth: 115)
                            .foregroundColor(specialtyVM.specialties[index].isClicked ? ThemeColor.primary : ThemeColor.grayDark)
                            .background(specialtyVM.specialties[index].isClicked ? ThemeColor.primaryLight : .white)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(specialtyVM.specialties[index].isClicked ? ThemeColor.primary : ThemeColor.grayDark, lineWidth: 1)
                            )
                    })
                }
            }
        }
        .padding(.horizontal)
    }
}
