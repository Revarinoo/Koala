//
//  ReportForm.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import SwiftUI

struct PostForm: View {
    @Binding var post: PostModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Instagram Post")
                .font(.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
                .padding(.bottom, 5)
                .padding(.top, 20)
            Text("Likes")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total likes", value: $post.likes, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 3)
            Text("Comments")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter total comments", value: $post.comments, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 3)
            
            Text("Post Link")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter instagram post link", text: $post.link).textFieldStyle(OvalTextFieldStyleForm())
                .padding(.bottom, 5)
        }
        .padding([.leading, .trailing], 16)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct PostForm_Previews: PreviewProvider {
    static var previews: some View {
        PostForm(post: .constant(PostModel(likes: 0, comments: 0, link: "")))
            .previewLayout(.sizeThatFits)
    }
}
