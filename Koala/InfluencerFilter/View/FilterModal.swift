//
//  FilterModal.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//  Edited by Reva

import SwiftUI

struct FilterModal: View {
    
    @Binding var isPresented: Bool
    @Binding var location: [String]
    @Binding var specialties: [String]
    @Binding var minPrice: Int
    @Binding var maxPrice: Int
    @Binding var engagementRate: Double
    @Binding var rating: Int
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading, spacing: 16) {
                Divider()
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity)
                LocationFilter(location: $location)
                SpecialtySelector(specialties: $specialties)
                PriceRange(minPrice: $minPrice, maxPrice: $maxPrice)
                EngagementRateSlider(engagementRate: $engagementRate)
                RatingStar(rating: $rating)
                Spacer()
            }
            .navigationBarTitle("Filter", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        isPresented = false
                    }
                }
            }
        }
        .onTapGesture {
            self.dismissKeyboard()
        }
        .preferredColorScheme(.light)
    }
}
