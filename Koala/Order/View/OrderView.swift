//
//  OrderView.swift
//  Koala
//
//  Created by Sholihatul Richas on 26/10/21.
//

import SwiftUI
import Introspect

struct OrderView: View {
    @State private var orderTypeSelected : OrderStatus = .pending
    @State var uiTabarController: UITabBarController?
    
    var pendingOrder : [MyOrders] = []
    
    init(){
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ThemeColor.primary)
        UISegmentedControl.appearance().backgroundColor = UIColor(ThemeColor.background)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        UINavigationBar.appearance().backgroundColor = UIColor(ThemeColor.background)
    }
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Text("My Orders")
                        .font(Font.custom(ThemeFont.poppinsSemiBold, size: 27))
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    Spacer()
                }
                Picker("What is your favorite color?", selection: $orderTypeSelected) {
                    ForEach (OrderStatus.allCases, id: \.self){
                        Text($0.rawValue)                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 16)
                ChosenStatus(selectedStatus: orderTypeSelected )
                Spacer()
                
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .padding(.top, 40)
            .background(ThemeColor.background.ignoresSafeArea())
        }.introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden = false
            uiTabarController = UITabBarController
        }
        
    }
    
}

enum OrderStatus: String, CaseIterable{
    case pending = "Pending"
    case ongoing = "Ongoing"
    case completed = "Completed"
}

struct ChosenStatus: View {
    
    var selectedStatus: OrderStatus
    @ObservedObject var orderViewModel = OrderViewModel()
    init(selectedStatus: OrderStatus){
        self.selectedStatus = selectedStatus
        orderViewModel.callData()
    }
    var body: some View {
        switch selectedStatus {
        case .pending:
            PendingCardScrollView(pendingOrders:orderViewModel.pendingOrders)
        case .ongoing:
            OngoingCardScrollView(onGoingOrders: orderViewModel.ongoingOrders)
        case .completed:
            CompletedCardScrollView(completedOrders: orderViewModel.completedOrders)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
