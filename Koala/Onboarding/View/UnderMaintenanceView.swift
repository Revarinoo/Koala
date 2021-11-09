//
//  UnderMaintenanceView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 09/11/21.
//

import SwiftUI

struct UnderMaintenanceView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            Image("underMaintenance")
                .offset(x: (UIScreen.main.bounds.width / 2) - 112, y: (UIScreen.main.bounds.height / -2) + 240)
            
            VStack {
                Spacer()
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 40))
                    .foregroundColor(ThemeColor.primary)
                    .padding(.bottom, 2)
                
                VStack {
                    Text("Influencer page currently")
                    Text("under construction")
                }
                .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                .foregroundColor(ThemeColor.primary)
                .padding(.bottom, 128)
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                    .padding(15)
                    .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                    .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.white)
                .background(ThemeColor.primary)
                .cornerRadius(15)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 10, trailing: 15))
            }
        }
        .accentColor(.white)
        .navigationBarHidden(true)
    }
}

struct UnderMaintenanceView_Previews: PreviewProvider {
    static var previews: some View {
        UnderMaintenanceView()
    }
}
