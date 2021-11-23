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
    @StateObject var orderListVM = OrderListViewModel()
    @State private var orderTypeSelected : OrderListStatus = .incoming
    @StateObject var userProfile = UserProfileViewModel.shared
    
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
                Picker("", selection: $orderTypeSelected) {
                    ForEach (OrderListStatus.allCases, id: \.self){
                        Text($0.rawValue)                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 16)
                .padding(.top, 157)
                
                ScrollView {
                    
                    VStack{
                        switch orderTypeSelected {
                        case .incoming:
                            ForEach(orderListVM.incomingOrders, id: \.id) { order in
//                                NavigationLink(destination: )
                                OrderListCard(orderList: order)
                            }
                        case .ongoing:
                            ForEach(orderListVM.ongoingOrders, id: \.id) { order in
                                OrderListCard(orderList: order)
                            }
                        case .completed:
                            ForEach(orderListVM.completedOrders, id: \.id) { order in
                                OrderListCard(orderList: order)
                            }
                        }
                    }
                    .padding()
                    
                
                }
                
                Spacer()
            }
            .navigationBarTitle("Order List")
            .background(Color.init(hex: "F2F2F2"))
            .edgesIgnoringSafeArea(.top)
        }
        .onAppear {
            orderListVM.fetchOrderList()
            userProfile.callData()
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
