//
//  ReportForm.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import SwiftUI

struct PostForm: View {
    @Binding var likes: Int
    @Binding var comments: Int
    @Binding var link: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Instagram Post")
                .font(.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
                .padding(.bottom, 12)
                .padding(.top, 20)
            Text("Likes")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total likes", value: $likes, formatter: NumberFormatter()).textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 18)
            Text("Comments")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total comments", value: $comments, formatter: NumberFormatter()).textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 18)
            
            Text("Comments")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter instagram post link", text: $link).textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 18)
        }
        .padding([.leading, .trailing], 16)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct PostForm_Previews: PreviewProvider {
    static var previews: some View {
        PostForm(likes: .constant(4300), comments: .constant(101), link: .constant("https://koala-influencer.xyz"))
            .previewLayout(.sizeThatFits)
    }
}
