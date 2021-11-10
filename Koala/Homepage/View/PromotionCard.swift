//
//  PromotionCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 21/10/21.
//  Edited by Syahrul Fadholi

import SwiftUI

struct PromotionCard: View {
    
    @State var nextNavigation: Bool = false
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text("Welcoming Offer").font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .multilineTextAlignment(.leading)
                    Image(systemName: "sparkles")
                }
                Text("10% off your first order with influencer").font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                
                NavigationLink(
                    destination: TabBar(selectedTab: 1).navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true),
                    isActive: $nextNavigation,
                    label: {
                        Button(
                            action:{
                                nextNavigation.toggle()
                            },
                            label: {
                                Text("Book Influencer").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                    .foregroundColor(.white)
                                    .frame(height: 30)
                            }
                        )
                            .frame(width: 159, height: 30, alignment: .center)
                            .background(ThemeColor.primary)
                            .cornerRadius(10)
                    })
                
            }.padding(.leading, 10)
            Image("offer").padding()
        }
        .padding(10)
        .padding(.vertical, 2)
        .background(ThemeColor.primaryLight)
        .frame(height: 136, alignment: .leading)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 3, x: 1, y: 2)
    }
}

struct PromotionCard_Previews: PreviewProvider {
    static var previews: some View {
        PromotionCard()
    }
}
