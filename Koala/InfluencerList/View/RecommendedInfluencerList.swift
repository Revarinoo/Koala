//
//  RecommendedInfluencerList.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 25/10/21.
//

import SwiftUI

struct RecommendedInfluencerList: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var recomenndationList = RecommendationViewModel()
    @State private var searchText = ""
    
    var categories : [String]
    
    init(categories: [String]) {
        self.categories = categories
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                            .foregroundColor(ThemeColor.primary)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text("Recommended Influencer List")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 17))
                        .padding(.trailing)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
                
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 10))
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(recomenndationList.recommendationModel.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { influencer in
                            NavigationLink(destination: LoginView()) {
                                RecommendationInfluencerCard(photoURL: influencer.photo, categories: influencer.category, name: influencer.name, price: influencer.price)
                                    .padding(.leading,16).padding(.trailing, 16)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .accentColor(.white)
        .navigationBarHidden(true)
        .onAppear() {
            recomenndationList.callGetInfluencerList(categories: categories)
        }
    }
}

struct RecommendedInfluencerList_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedInfluencerList(categories: ["Coffee"])
    }
}
