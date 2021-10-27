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
            ScrollView(.horizontal){
                HStack(spacing:12){
                    

                    ForEach(projects ?? []){ project in
                        PreviousProjectCard(photoURL: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg", reach: Double(project.sum_reach).thousandsFormatter(), impression: Double(project.sum_impressions).thousandsFormatter())
                    }
                }.padding([.leading, .top, .bottom], 16)
            }

        }
    }
}

//struct PreviousProjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviousProjectView().previewLayout(.sizeThatFits)
//    }
//}
