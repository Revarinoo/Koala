//
//  ImageSlider.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageSlider: View {
    
    @Binding var index: Int
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var projects: [ProjectModel]
    
    var body: some View {
        
        GeometryReader { proxy in
            
            let width = proxy.size.width
            
            HStack (spacing: 0) {
                ForEach(projects, id: \.id) { project in
                    VStack (alignment: .leading){
                        PreviousProjectCard(post_photo: project.post_photo, business_photo: project.business_photo, business_name: project.business_name, total_comments: project.total_comments, total_likes: project.total_likes, engagement_rate: project.engagement_rate)
                    }
                    .frame(width: 358, height: 140)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.init(hex: "C4C4C4"), radius: 3, x: 0, y: 3)
                    .padding(.trailing, 16)
                    .padding(.leading, 16)
                }
            }
            .offset(x: (CGFloat(currentIndex) * -width) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        currentIndex = max(min(currentIndex + Int(roundIndex), projects.count-1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundIndex), projects.count-1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
        .frame(height: 148)
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        FollowerProfile(projects: [ProjectModel(id: 1, business_photo: "https://media.matamata.com/thumbs/2021/05/26/91972-rose-blackpink-instagramatroses-are-rosie/745x489-img-91972-rose-blackpink-instagramatroses-are-rosie.jpg", business_name: "Kopi Memory", total_likes: "100K", total_comments: "20K", engagement_rate: "10.3%", post_photo: "https://media.matamata.com/thumbs/2021/05/26/91972-rose-blackpink-instagramatroses-are-rosie/745x489-img-91972-rose-blackpink-instagramatroses-are-rosie.jpg", comment: "HEYADAD")])
    }
}
