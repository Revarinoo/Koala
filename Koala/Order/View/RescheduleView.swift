//
//  RescheduleView.swift
//  Koala
//
//  Created by Clara Anggraini on 02/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RescheduleView: View {
//    let orderID: Int
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    @State private var showingAlert = false
    @StateObject private var rescheduleViewModel = RescheduleViewModel()
    var body: some View {
        ZStack {
        Color.black.opacity(0.3).ignoresSafeArea()
                   
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
                               showingAlert.toggle()
                               
                               
                           }, label: {
                               Text("Save").font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                           })
                           
                       }
                       .padding(.horizontal)

                   }.alert(isPresented: $showingAlert) {
                       Alert(
                           title: Text("Reschedule Order"),
                           message: Text("Are you sure you want to reschedule posting date?"),
                           primaryButton: .default(Text("No"), action: {
                               
                           }),
                           secondaryButton: .default(Text("Yes").font(Font.custom(ThemeFont.poppinsBold, size: 14)).bold(), action: {
                               savedDate = selectedDate
                               showDatePicker = false
//                               rescheduleViewModel.rescheduleCampaign(orderID: orderID, schedule: savedDate ?? Date())
                           })
                       )
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
