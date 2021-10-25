//
//  RegisterInfluencerView.swift
//  Koala
//
//  Created by Revarino Putra on 23/10/21.
//

import SwiftUI

struct RegisterInfluencerView: View {
    @Binding var constant: String
    var body: some View {
        VStack (alignment: .leading) {
            Text("Instagram Username")
                .font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                .foregroundColor(ThemeColor.grayDark)
            TextField("Enter your instagram username", text: $constant)
                .textFieldStyle(OvalTextFieldStyle())
        }
    }
}

struct RegisterInfluencerView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterInfluencerView(constant: .constant(""))
    }
}
