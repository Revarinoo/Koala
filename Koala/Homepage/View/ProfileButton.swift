//
//  ProfileButton.swift
//  Koala
//
//  Created by Sholihatul Richas on 20/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileButton: View {
    let photoURL: String
    let name: String
    var body: some View {
        ZStack(alignment:.leading){
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                HStack{
                    WebImage(url: URL(string: photoURL))
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 36, height: 36)
                    Spacer()
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(.black)
                    Spacer()
                }
            }
                .frame(width: 122.0, height: 36.0)
                .background(Color.white)
                .cornerRadius(50)
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", name: "Kenneth J").previewLayout(.sizeThatFits)
    }
}
