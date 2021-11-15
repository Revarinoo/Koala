//
//  PreviousProjectVIew.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI

struct PreviousProjectView: View {
    let projects: [ProjectModel]
    
    var body: some View {
        VStack (alignment: .leading) {
            
            if projects.isEmpty {
                Text("Previous Projects")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                HStack {
                    Text("No projects yet")
                        .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                        .foregroundColor(.black)
                        .frame(minWidth: 300, maxWidth: 356)
                        .padding(.top, 10)
                }
            } else {
                Text("Previous Projects")
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .foregroundColor(.black)
                    .padding(.leading,16)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:5){
                        ForEach(projects){ project in
                            PreviousProjectCard(photoURL: project.business_photo, reach: Double(project.sum_reach).thousandsFormatter(), impression: Double(project.sum_impressions).thousandsFormatter())
                        }
                        .padding([.leading, .bottom], 16)
                    }
                }
            }
        }
    }
}

struct PreviousProjectView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousProjectView(projects: []).previewLayout(.sizeThatFits)
    }
}
