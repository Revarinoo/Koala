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
    @StateObject var orderDetailVM = InfluencerCampaignDetailViewModel.shared
    @State var uploadingView = false
    var orderId: Int
    
    var body: some View {
        NavigationView{
            ScrollView (.vertical, showsIndicators: false) {
                ZStack {
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
                    
                    if uploadingView
                    {
                        ThemeColor.primary.ignoresSafeArea()
                        VStack(spacing: 25){
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: ThemeColor.secondary))
                                .scaleEffect(3)
                            Text("Uploading Your Data").foregroundColor(.white).font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                            Spacer()
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
                    .alert(isPresented: $reportVM.isSucceed) {
                        Alert(
                            title: Text("Success"),
                            message: Text("Congratulation, you're report successfully submited"),
                            dismissButton: .default(Text("Got it!")){
                                reportVM.isSucceed = true
                                isModalPresented = false
                                orderDetailVM.getOrderDetails(id: orderId)
                            }
                        )
                    }
                }
                
            }
        }
        .preferredColorScheme(.light)
        .navigationAppearance(backgroundColor: .white, foregroundColor: .black, hideSeparator: true)
        .onTapGesture {
            self.dismissKeyboard()
        }
        .onAppear {
            orderDetailVM.getOrderDetails(id: orderId)
        }
        
    }
}

//struct SubmitReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitReportView()
//    }
//}
