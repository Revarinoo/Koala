//
//  PreviousProjectVIew.swift
//  Koala
//
//  Created by Jonathan Clive on 25/10/21.
//

import SwiftUI

struct PreviousProjectVIew: View {
    let previousProjects = PreviousProjectViewModel().previousProjects
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Previous Projects")
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                .foregroundColor(.black)
            ScrollView(.horizontal){
                HStack(spacing:12){
                    ForEach(previousProjects){ i in
                        PreviousProjectCard(photoURL: i.userImage, reach: i.reach, impression: i.impression)
                    }
                }
            }

        }
    }
}

struct PreviousProjectVIew_Previews: PreviewProvider {
    static var previews: some View {
        PreviousProjectVIew().previewLayout(.sizeThatFits)
    }
}
