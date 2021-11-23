//
//  ReviewInfluencerView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReviewInfluencerView: View {
    
    var photoURL: String
    var name: String
    var orderId: Int
    
    @ObservedObject var reviewVM = ReviewPageViewModel()
    @State var submitButtonPressed: Bool = false
    @Binding var isPresent : Bool
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.bgColorView.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    WebImage(url: URL(string: photoURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .cornerRadius(10)
                        .padding(.all, 10)
                        .padding(.leading, 12)
                    VStack {
                        Text("How was your experience")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                        Text("with \(name)?")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 24))
                    }
                    VStack(spacing: 8) {
                        StarReviewComponent(rating: $reviewVM.reviewModel.rating)
                        Text("Give 1 star for bad service, 5 for great")
                            .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                            .foregroundColor(ThemeColor.grayDark)
                    }
                    .padding(.vertical, 2)
                    
                    HStack {
                        Text("Write a comment")
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 16))
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 28, leading: 16, bottom: 8, trailing: 0))
                    
                    VStack {
                        TextEditor(text: $reviewVM.reviewModel.comment)
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .frame(maxHeight: 180)
                            .shadow(color: ThemeColor.gray, radius: 8, x: 0, y: 5)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 10))
                    .padding(.horizontal, 20)
                    
                    Button {
                        if(reviewVM.validateUserReview()) {
                            reviewVM.submitReview(orderId: orderId)
                            submitButtonPressed.toggle()
                        }
                    } label: {
                        Text("Submit")
                            .padding(15)
                            .font(Font.custom(ThemeFont.poppinsSemiBold, size: 18))
                            .frame(minWidth: 326, maxWidth: .infinity, alignment: .center)
                    }
                    .foregroundColor(.white)
                    .background(ThemeColor.primary)
                    .cornerRadius(12)
                    .padding(.bottom, 8)
                    .alert(isPresented: $submitButtonPressed, content: {
                        Alert(title: reviewVM.reviewModel.isPresentingErrorAlert ? Text("Alert") : Text("Success"), message: reviewVM.reviewModel.isPresentingErrorAlert ? Text(reviewVM.reviewModel.errorMessage) : Text("Review already recorded, Thank you"), dismissButton: .cancel(Text("Ok")))
                    })
                    .padding(EdgeInsets(top: 48, leading: 16, bottom: -24, trailing: 16))
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.isPresent = false
                    }){
                        HStack{
                            Image(systemName: "chevron.left")
                            Text("My Orders")
                        }
                        
                    }.foregroundColor(ThemeColor.primary)
                }
            }
        }
        
        .onTapGesture {
            self.dismissKeyboard()
        }
    }
}
