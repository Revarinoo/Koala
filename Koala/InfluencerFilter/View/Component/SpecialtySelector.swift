//
//  SpecialtySelector.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct SpecialtySelector: View {
    
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
                Button(action: {
                    
                }, label: {
                    Text("See more")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(.black)
                })
            }
            LazyVGrid(columns: columns) {
                ForEach(ConstantVariable.specialties.prefix(6), id: \.self) { item in
                    Text(item)
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .padding(.vertical, 4)
                        .frame(minWidth: 115)
                        .foregroundColor(ThemeColor.primary)
                        .background(ThemeColor.primaryLight)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(ThemeColor.primary, lineWidth: 1)
                        )
                }
            }
        }
        .padding(.horizontal)
    }
}

struct SpecialtySelector_Previews: PreviewProvider {
    static var previews: some View {
        SpecialtySelector().previewLayout(.sizeThatFits)
    }
}
