//
//  OrderListView.swift
//  Koala
//
//  Created by Revarino Putra on 22/11/21.
//

import SwiftUI

enum OrderListStatus: String, CaseIterable{
    case incoming = "Incoming"
    case ongoing = "Ongoing"
    case completed = "Completed"
}

struct OrderListView: View {
    
    @State private var orderTypeSelected : OrderListStatus = .incoming
    
    init(){
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ThemeColor.primary)
        UISegmentedControl.appearance().backgroundColor = UIColor(ThemeColor.background)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        UINavigationBar.appearance().backgroundColor = UIColor(ThemeColor.background)
    }
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("Order List")
                    .font(.custom(ThemeFont.sfProDisplay, size: 34))
                    .padding(EdgeInsets(top: 44, leading: 16, bottom: 10, trailing: 0))
                
                Picker("What is your favorite color?", selection: $orderTypeSelected) {
                    ForEach (OrderListStatus.allCases, id: \.self){
                        Text($0.rawValue)                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 16)
                
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}


struct ChosenOrder: View {
    
    var selectedStatus: OrderListStatus
    @ObservedObject var orderViewModel = OrderViewModel()

    init(selectedStatus: OrderListStatus){
        self.selectedStatus = selectedStatus
        orderViewModel.callData()
    }
    var body: some View {
        switch selectedStatus {
        case .incoming:
            PendingCardScrollView(orderVM: orderViewModel)
        case .ongoing:
            OngoingCardScrollView(onGoingOrders: orderViewModel.ongoingOrders)
        case .completed:
            CompletedCardScrollView(completedOrders: orderViewModel.completedOrders)
        }
    }
}
