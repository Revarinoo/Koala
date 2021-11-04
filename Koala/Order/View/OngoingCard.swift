//
//  OngoingCard.swift
//  Koala
//
//  Created by Sholihatul Richas on 26/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct OngoingCard: View {
    let order_id: Int
    let name: String
    let productType : [String]
    let dueDate : String
    @State var showDatePicker: Bool = false
    @State var savedDate: Date? = nil
    
    var body: some View {
        VStack{
            HStack(spacing: 18){
                WebImage(url: URL(string: "https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg"))
                    .resizable()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    HStack (spacing: 9){
                        ForEach (productType, id: \.self){
                            product in Text(product).scaledToFill()
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .foregroundColor(ThemeColor.primary)
                                .frame(minWidth: 71, minHeight: 20, alignment: .center)
                                .background(ThemeColor.primaryLight)
                                .cornerRadius(5)
                        }
                    }
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        Image(systemName: "calendar")
                        
                        Text(savedDate?.formatToString() ?? "")
                        
                    }.font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }.padding([.top, .leading, .trailing], 16)
            HStack{
                Spacer()
                Button(action: {
                    showDatePicker.toggle()
                    
                }){
                    Text("Reschedule").font(Font.custom(ThemeFont.poppinsMedium, size: 12))
                        .foregroundColor(.white)
                        .padding()
                        .padding([.leading, .trailing])
                }.frame(height: 38)
                    .background(ThemeColor.primary)
                    .cornerRadius(10)
            }.padding(.bottom, 9).padding(.trailing, 15)
                .fullScreenCover(isPresented: $showDatePicker) {
                    RescheduleView(order_id: order_id,showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
                        .animation(.linear)
                        .transition(.opacity)
                        .background(BackgroundCleanerView())
                        
                }
        }
        .background(Color.white)
        .cornerRadius(10)
        .onAppear{
            savedDate = dueDate.formatToDate()
        }
    }
}

struct OngoingCard_Previews: PreviewProvider {
    static var previews: some View {
        OngoingCard(order_id: 1,name: "Bella Anastasia", productType: ["Post"], dueDate: "28 November 2021").previewLayout(.sizeThatFits)
    }
}

struct BackgroundCleanerView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
    let view = UIView()
    
        DispatchQueue.main.async {
        view.superview?.superview?.backgroundColor = .clear
        
    }
        return view
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}
