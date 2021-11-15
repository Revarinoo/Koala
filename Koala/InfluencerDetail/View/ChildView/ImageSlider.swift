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
    
    var images: [AnalyticPhotoModel]
    
    var body: some View {
        
        GeometryReader { proxy in
            
            let width = proxy.size.width
            
            HStack (spacing: 0) {
                ForEach(images, id: \.id) { item in
                    VStack {
                        WebImage(url: URL(string: item.photo))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                    .frame(width: 358, height: 218)
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
                        currentIndex = max(min(currentIndex + Int(roundIndex), images.count-1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundIndex), images.count-1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
        .frame(height: 218)
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        FollowerProfile(images: [AnalyticPhotoModel(id: 1, photo: "")])
    }
}
