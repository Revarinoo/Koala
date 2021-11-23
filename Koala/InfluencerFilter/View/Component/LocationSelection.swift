//
//  LocationSelection.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 20/11/21.
//

import SwiftUI

struct LocationSelection: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var locationVM = LocationSelectorViewModel()
    @Binding var location: [String]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Button(
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Image(systemName: "chevron.left")
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                                .foregroundColor(ThemeColor.primary)
                                .cornerRadius(10)
                            
                        })
                    Spacer()
                    Text("Select Location")
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 16))
                        .foregroundColor(.black)
                    Spacer()
                    Button(
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Save")
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 16))
                                .foregroundColor(ThemeColor.primary)
                        })
                }
                .padding(.top, 8)
                
                ScrollView(showsIndicators: false) {
                    ForEach(locationVM.locations.indices) { index in
                        Button(
                            action: {
                                if locationVM.countLocationClicked() < 1 || locationVM.locations[index].isClicked == true {
                                    locationVM.locations[index].isClicked.toggle()
                                }
                                self.location = locationVM.getLocationClicked()
                            },
                            label: {
                                HStack {
                                    Text(locationVM.locations[index].name)
                                        .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                        .foregroundColor(locationVM.locations[index].isClicked ? .white : .black)
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(locationVM.locations[index].isClicked ? ThemeColor.primary : Color.white)
                                .cornerRadius(8)
                            }
                        )
                    }
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
