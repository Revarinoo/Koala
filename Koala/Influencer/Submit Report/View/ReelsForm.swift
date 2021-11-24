//
//  ReelsForm.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import SwiftUI

struct ReelsForm: View {
    @Binding var reels: ReelsModel
    
    var body: some View {
        VStack (alignment:.leading) {
            Text("Instagram Reels")
                .font(.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
                .padding(.bottom, 5)
                .padding(.top, 20)
            Text("Views")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total views", value: $reels.views, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 3)
            Text("Likes")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total likes", value: $reels.likes, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 3)
            Text("Comments")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total comments", value: $reels.comments, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 3)
            Text("Post Link")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter instagram post link", text: $reels.link).textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 5)
        }
        .padding([.leading, .trailing], 16)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct ReelsForm_Previews: PreviewProvider {
    static var previews: some View {
        ReelsForm(reels: .constant(ReelsModel()))
            .previewLayout(.sizeThatFits)
    }
}
