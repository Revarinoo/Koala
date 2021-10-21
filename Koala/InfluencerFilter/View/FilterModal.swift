//
//  FilterModal.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct FilterModal: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading, spacing: 16) {
                Divider()
                    .padding(.bottom)
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
                        print("Cancel tapped!")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        print("Save tapped!")
                    }
                }
            }
        }
    }
}

struct FilterModal_Previews: PreviewProvider {
    
    static var previews: some View {
        FilterModal()
    }
}
