//
//  InfluencerListView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 17/10/21.
//

import SwiftUI

struct InfluencerListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("JWT", store: .standard) var token = ""
    
    var showBackButton : Bool
    var categorySelected : String = ""
    
    @StateObject var influencerListVM = InfluencerListViewModel()
    @StateObject var filtersVM = FilterModalViewModel()
    @StateObject var specialtyVM = SpecialtyViewModel()
    @State var influencerDetailViewModel = InfluencerDetailViewModel()
    @State var isFilterModalShown: Bool = false
    @State private var searchText = ""
    @State var influencerID = 0
    @State var showDetails = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color.bgColorView.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    
//                    HStack {
//                        if showBackButton{
//                            Button(action: {
//                                self.presentationMode.wrappedValue.dismiss()
//                            }, label: {
//                                Image(systemName: "chevron.left")
//                                    .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
//                                    .foregroundColor(ThemeColor.primary)
//                                    .cornerRadius(10)
//                            })
//                        }
//                        Spacer()
//                        Text("Influencer List")
//                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 17))
//                            .padding(.trailing)
//                        Spacer()
//                    }
//                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
                    
                    SearchBar(text: $searchText)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 8, trailing: 10))
                    
                    HStack {
                        Button(action: {
                            self.isFilterModalShown = true
                        }, label: {
                            Image("filterIcon")
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 10))
                                .padding(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
                                .background(ThemeColor.primary)
                                .cornerRadius(10)
                        })
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                if categorySelected != "" {
                                    Text(categorySelected)
                                        .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .foregroundColor(ThemeColor.primary)
                                        .background(ThemeColor.primaryLight)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(ThemeColor.primary, lineWidth: 1)
                                                .frame(maxHeight: 33)
                                        )
                                } else {
                                    ForEach(filtersVM.getFormattedFilters(), id: \.self) { filter in
                                        Text(filter)
                                            .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .foregroundColor(ThemeColor.primary)
                                            .background(ThemeColor.primaryLight)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(ThemeColor.primary, lineWidth: 1)
                                                    .frame(maxHeight: 33)
                                            )
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 4, leading: 3, bottom: 5, trailing: 0))
                        }
                    }.padding(EdgeInsets(top: -2, leading: 10, bottom: 8, trailing: 0))
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(influencerListVM.influencersModel.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }), id:\.id) { influencer in
                                if token != ""{
                                    Button(action:{
                                        self.influencerID = influencer.id
                                        showDetails = true
                                        influencerDetailViewModel.callGetInfluencerDetail(influencer_id: influencer.id)
                                    }){
                                        InfluencerCardList(photoURL: influencer.photo, categories: influencer.category, name: influencer.name, location: influencer.location, price: influencer.ratePrice, ER: influencer.rateEngagement, rating: influencer.rating)
                                            .padding(.horizontal, 10)
                                    }
                                }else {
                                    NavigationLink(destination: LoginView()) {
                                        InfluencerCardList(photoURL: influencer.photo, categories: influencer.category, name: influencer.name, location: influencer.location, price: influencer.ratePrice, ER: influencer.rateEngagement, rating: influencer.rating)
                                            .padding(.horizontal, 10)
                                                                        }
                                }
                            }
                        }
                    }
                    
                }.onAppear() {
                    if categorySelected != "" {
                        influencerListVM.callGetInfluencerByCategory(categorySelected)
                    } else {
                        influencerListVM.callGetInfluencerList()
                    }
                }
            }
            .navigationBarTitle("Influencer List", displayMode: .inline)
            .navigationBarHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if showBackButton{
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                        }.foregroundColor(ThemeColor.primary)
                    }
                }
            }
            .fullScreenCover(isPresented: $showDetails){
                InfluencerDetailView(influencerDetailViewModel: $influencerDetailViewModel, isPresent: $showDetails, previousView: "Influencer List", influencerID: $influencerID, fromBackButton: showBackButton)
            }
            
            .navigationBarColor(backgroundColor: .clear, titleColor: .black, tintColor: UIColor(ThemeColor.primary))
            
            .sheet(isPresented: $isFilterModalShown) {
                FilterModal(isPresented: $isFilterModalShown, location: $filtersVM.location, specialties: $filtersVM.specialties, minPrice: $filtersVM.minPrice, maxPrice: $filtersVM.maxPrice, engagementRate: $filtersVM.engagementRate, rating: $filtersVM.rating)
            }
        }
    }
}

struct InfluencerListView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerListView(showBackButton: false)
    }
}
