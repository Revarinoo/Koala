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
    let photo: String
    @State var showDatePicker: Bool = false
    @State var savedDate: Date? = nil
    
    var body: some View {
        VStack{
            HStack {
                Image("ig")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                ForEach (productType, id: \.self){
                    product in Text(product).font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                }
                
                Spacer()
                Text("12.12 Campaign")
                    .font(Font.custom(ThemeFont.poppinsRegular, size: 12))
                    .foregroundColor(Color.init(hex: "A7A7A7"))
            }
            .padding(.horizontal, 15)
            .padding(.bottom, -10)
            .padding(.vertical, 10)
            .padding(.trailing, 2)
            Divider()
            HStack(spacing: 18){
                WebImage(url: URL(string: photo))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 88)
                    .cornerRadius(10)
                VStack (alignment: .leading, spacing: 6){
                    
                    Text(name).font(Font.custom(ThemeFont.poppinsMedium, size: 18))
                    HStack{
                        Image(systemName: "calendar")
                        
                        Text(savedDate?.formatToString() ?? "")
                        
                    }.font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                        .foregroundColor(Color.gray)
                }
                Spacer()
            }.padding([.top, .leading, .trailing], 16).padding(.top, -5)
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
        OngoingCard(order_id: 1,name: "Bella Anastasia", productType: ["Post"], dueDate: "28 November 2021", photo: "").previewLayout(.sizeThatFits)
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
