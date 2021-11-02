//
//  RescheduleView.swift
//  Koala
//
//  Created by Clara Anggraini on 02/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RescheduleView: View {
    
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {
        ZStack {
                   Color.black.opacity(0.3)
                       .edgesIgnoringSafeArea(.all)
                   
                   
                   VStack {
                       Text("Reschedule").font(Font.custom(ThemeFont.poppinsSemiBold, size: 14))
                       Divider()
                       DatePicker("Test", selection: $selectedDate, displayedComponents: [.date])
                           .datePickerStyle(.graphical)
                       
                       Divider()
                       HStack {
                           
                           Button(action: {
                               self.showDatePicker = false
                           }, label: {
                               Text("Cancel").font(Font.custom(ThemeFont.poppinsRegular, size: 14))
                           })
                           
                           Spacer()
                           
                           Button(action: {
                               savedDate = selectedDate
                               showDatePicker = false
                           }, label: {
                               Text("Save").font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                           })
                           
                       }
                       .padding(.horizontal)

                   }
                   .padding()
                   .background(
                       Color.white
                           .cornerRadius(30)
                   )

                   
               }
    }
}

//struct Reschedule_Previews: PreviewProvider {
//    static var previews: some View {
//        RescheduleView(showDatePicker: self.$showDatePicker, savedDate: self.$savedDate).previewLayout(.sizeThatFits)
//    }
//}
