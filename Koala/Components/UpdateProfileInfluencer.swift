//
//  UpdateProfileInfluencer.swift
//  Koala
//
//  Created by Sholihatul Richas on 28/11/21.
//

import SwiftUI

struct UpdateProfileInfluencer: View {
    @Binding var showSheet : Bool
    var body: some View {
        VStack(spacing : 15){
            Text("Update ptofile to continue").font(Font.custom(ThemeFont.poppinsSemiBold, size: 18)).foregroundColor(ThemeColor.primary)
            Button(action: {
                showSheet = true
            }){
                    Text("Update Now").font(Font.custom(ThemeFont.poppinsSemiBold, size: 15))
                        .foregroundColor(.white)
                        .padding()
                        .padding([.leading, .trailing])
                        .frame(height: 38)
                }
                    .frame (height: 33)
                    .background(ThemeColor.primary)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(ThemeColor.primary, lineWidth: 1)
                    )
            
        }
        
    }
}

struct UpdateProfileInfluencer_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileInfluencer(showSheet: .constant(true))
    }
}
