//
//  ProfileView.swift
//  Koala
//
//  Created by Sholihatul Richas on 25/11/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image(systemName: "camera").font(.system(size: 36)).foregroundColor(.gray).scaledToFill().frame(width: 127, height: 127)
                .background(ThemeColor.background)
                .cornerRadius(20.0)
                .overlay(RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.white, lineWidth: 5))
            VStack(alignment : .leading){
                ProfileElement()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileElement : View {
    var body : some View {
        VStack{
            Text("Name").font(Font.custom(ThemeFont.poppinsRegular, size: 14)).foregroundColor(.gray)
            Text("Clara Ang").font(Font.custom(ThemeFont.poppinsRegular, size: 16)).foregroundColor(.black)
        }
    }
}
