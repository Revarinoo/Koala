//
//  FilterModal.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 21/10/21.
//

import SwiftUI

struct FilterModal: View {
    
    var body: some View {
        NavigationView {
            Text("Filter Modal View")
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
