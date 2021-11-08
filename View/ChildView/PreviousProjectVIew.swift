//
//  PreviousProjectVIew.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI

struct PreviousProjectView: View {
    let projects: [ProjectModel]?
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Previous Projects")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
                .padding(.leading,16)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:12){
            
                    ForEach(projects ?? []){ project in
                        PreviousProjectCard(photoURL: project.business_photo, reach: Double(project.sum_reach).thousandsFormatter(), impression: Double(project.sum_impressions).thousandsFormatter())
                    }
                }.padding([.leading, .bottom, .trailing], 16)
            }

        }
    }
}
