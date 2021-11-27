//
//  SubmitReportView.swift
//  Koala
//
//  Created by Revarino Putra on 24/11/21.
//

import SwiftUI

struct SubmitReportView: View {
    
    @Binding var isModalPresented: Bool
    @StateObject var reportVM = SubmitReportViewModel()
    @StateObject var orderDetailVM = InfluencerCampaignDetailViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                        ForEach(orderDetailVM.campaignDetailModel) { data in
                            switch data.content_type {
                            case "Instagram Post":
                                PostForm(post: $reportVM.igPost)
                                    .onAppear {
                                        reportVM.contents.append(ContentStorage(type: ContentType.Post, orderDetailId: data.order_detail_id))
                                    }
                                
                            case "Instagram Story":
                                StoryForm(story: $reportVM.igStory)
                                    .onAppear {
                                        reportVM.contents.append(ContentStorage(type: ContentType.Story, orderDetailId: data.order_detail_id))
                                    }
                            case "Instagram Reels":
                                ReelsForm(reels: $reportVM.igReels)
                                    .onAppear {
                                        reportVM.contents.append(ContentStorage(type: ContentType.Reels, orderDetailId: data.order_detail_id))
                                    }
                            default: PostForm(post: $reportVM.igPost)
                        }
                    }
                }
            }
            .navigationTitle("Submit Report")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.isModalPresented = false
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
        .navigate(to: OrderListView(), when: $reportVM.isSucceed)
        
        // MARK: Sementara, nanti hapus -/\-
        .onAppear {
            orderDetailVM.getOrderDetails(id: 1)
        }
        
    }
}

//struct SubmitReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitReportView()
//    }
//}
