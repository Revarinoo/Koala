//
//  ImageSlider.swift
//  Koala
//
//  Created by Revarino Putra on 25/10/21.
//

import SwiftUI

struct ImageSlider<Content: View, T: Identifiable>: View {
    
    
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T)-> Content) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    var body: some View {
//        VStack {
//            TabView {
//                ForEach(images, id: \.self) { item in
//                    Image(item)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 284, height: 218, alignment: .center)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle())
//        }
//        .frame(width: 358, height: 218)
//        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
        
        
        GeometryReader { proxy in
            
            let width = proxy.size.width
            
            HStack (spacing: 0) {
                ForEach(list) { item in
                    VStack {
                        content(item)
                            .frame(width: width)
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
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count-1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        index = max(min(currentIndex + Int(roundIndex), list.count-1), 0)
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
        .frame(height: 218)
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        FollowerProfile()
    }
}
