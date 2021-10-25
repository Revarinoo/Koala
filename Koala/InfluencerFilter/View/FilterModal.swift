//
//  FilterModal.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct FilterModal: View {
    
    @Binding var isPresented: Bool
    @State var rating: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading, spacing: 16) {
                Divider()
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity)
                LocationFilter()
                SpecialtySelector()
                PriceRange()
                EngagementRateSlider()
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
    }
}
