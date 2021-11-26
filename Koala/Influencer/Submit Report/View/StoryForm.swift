//
//  StoryForm.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import SwiftUI

struct StoryForm: View {
    @Binding var story: StoryModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Instagram Story")
                .font(.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
                .padding(.bottom, 5)
                .padding(.top, 20)
            Text("Views")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total views", value: $story.views, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 3)
            Text("Reach")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total reach", value: $story.reach, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 3)
            Text("Impression")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total views", value: $story.impression, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 5)
        }
        .padding([.leading, .trailing], 16)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct StoryForm_Previews: PreviewProvider {
    static var previews: some View {
        StoryForm(story: .constant(StoryModel(views: 0, reach: 0, impression: 0)))
            .previewLayout(.sizeThatFits)
    }
}
