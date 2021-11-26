//
//  Review.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI

struct ReviewView: View {
    var projects: [ProjectModel] = []
    
    var body: some View {
        HStack{
            VStack (alignment: .leading) {
                Text("Reviews")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:12){
                        if projects.isEmpty {
                            HStack {
                                Text("No reviews yet")
                                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                                    .foregroundColor(.black)
                                    .frame(minWidth: 300, maxWidth: 356)
                                    .padding(.top, 10)
                            }
                        } else {
                            ForEach(projects){ project in
                                ReviewCard(business_name: project.business_name, message: project.comment)
                            }
                        }
                    }.padding(.bottom, 8)
                }
                
                
            }
            Spacer()
        }
        .frame(width: 358)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        
        ReviewView(projects: [ProjectModel(id: 1, business_photo: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", business_name: "Kopi Kenangan", total_likes: "12000", total_comments: "1222", engagement_rate: "1.3", post_photo: "", comment: "Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.Creative Content and amazing result of brand awareness.")]).previewLayout(.sizeThatFits)
    }
}
