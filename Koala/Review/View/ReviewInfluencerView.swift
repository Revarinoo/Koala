//
//  ReviewInfluencerView.swift
//  Koala
//
//  Created by Syahrul Apple Developer BINUS on 25/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReviewInfluencerView: View {
    
    var photoURL: String?
    var name: String
    
    @Binding var rating: Int
    @State var comment: String = ""

    var maximumRating = 5

    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    @State var backToHistoryView: Bool = false
    @State var isPresentingAlert: Bool = false
    
    var body: some View {
        ZStack {
            Color.bgColorView.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(Font.custom(ThemeFont.poppinsMedium, size: 20))
                            .foregroundColor(ThemeColor.primary)
                            .cornerRadius(10)
                    })
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
                    Spacer()
                }
                Spacer()
            }
            
            VStack(alignment: .center) {
                WebImage(url: URL(string: photoURL ?? "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"))
                    .resizable()
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
                VStack(spacing: 4) {
                    HStack {
                        ForEach(1..<maximumRating + 1) { number in
                            self.image(for: number)
                                .font(Font.system(size: 36))
                                .foregroundColor(ThemeColor.primary)
                                .onTapGesture {
                                    self.rating = number
                                }
                        }
                    }
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
                    TextEditor(text: $comment)
                        .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                        .foregroundColor(ThemeColor.grayDark)
                        .disableAutocorrection(true)
                        .frame(maxHeight: 180)
                }
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 5))
                .padding(.horizontal, 18)
                
                NavigationLink(
                    destination: Text("Review Success").navigationBarBackButtonHidden(true),
                    isActive: $backToHistoryView,
                    label: {
                        Button {
                            backToHistoryView.toggle()
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
                        .alert(isPresented: $isPresentingAlert, content: {
                            Alert(title: Text("Alert"), message: Text("Success"), dismissButton: .cancel(Text("Ok")))
                        })
                    })
                    .padding(EdgeInsets(top: 48, leading: 16, bottom: -24, trailing: 16))
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct ReviewInfluencerView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewInfluencerView(photoURL: nil, name: "Clara Ang", rating: .constant(4))
    }
}
