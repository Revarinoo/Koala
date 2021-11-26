//
//  ExpandableText.swift
//  Koala
//
//  Created by Clara Anggraini on 26/11/21.
//

import Foundation
import SwiftUI

struct ExpandableText: View {
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    private var text: String

    let lineLimit: Int

    init(_ text: String, lineLimit: Int) {
        self.text = text
        self.lineLimit = lineLimit
    }

    private var moreLessText: String {
        if !truncated {
            return ""
        } else {
            return self.expanded ? "show less" : " show more"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .background(
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { visibleTextGeometry in
                            ZStack { 
                                Text(self.text)
                                    .background(GeometryReader { fullTextGeometry in
                                        Color.clear.onAppear {
                                            self.truncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        })
                        .hidden()
            )
            if truncated {
                Button(action: {
                    withAnimation {
                        expanded.toggle()
                    }
                }, label: {
                    Text(moreLessText).foregroundColor(ThemeColor.darkOrange)
                })
            }
        }
    }
}


struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    VStack(alignment: .leading, spacing: 10) {
        ExpandableText("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut laborum", lineLimit: 5)


    }.padding()
  }
}
