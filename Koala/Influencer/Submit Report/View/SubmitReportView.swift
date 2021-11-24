//
//  SubmitReportView.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import SwiftUI

struct SubmitReportView: View {
    @StateObject var reportVM = SubmitReportViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    PostForm(post: $reportVM.igPost)
                    StoryForm(story: $reportVM.igStory)
                    ReelsForm(reels: $reportVM.igReels)
                }
            }
            .navigationTitle("Submit Report")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                    }.foregroundColor(ThemeColor.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        reportVM.submit()
                    } label: {
                        Text("Submit")
                            .foregroundColor(ThemeColor.primary)
                    }

                }
            }
        }
        .preferredColorScheme(.light)
        .navigationAppearance(backgroundColor: .white, foregroundColor: .black, hideSeparator: true)
        .onTapGesture {
            self.dismissKeyboard()
        }
    }
}

struct SubmitReportView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitReportView()
    }
}
