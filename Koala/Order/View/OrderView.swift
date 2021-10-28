//
//  OrderView.swift
//  Koala
//
//  Created by Sholihatul Richas on 26/10/21.
//

import SwiftUI

struct OrderView: View {
    @State private var orderTypeSelected : OrderStatus = .pending
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ThemeColor.primary)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        //UISegmentedControl.appearance().setTitleTextAttributes([.backgroundColor: UIColor.blue], for: .normal)
        //MyOrderService.getMyOrder(<#MyOrderService#>)
    }
    var body: some View {
        NavigationView {
            VStack{
                Picker("What is your favorite color?", selection: $orderTypeSelected) {
                    ForEach (OrderStatus.allCases, id: \.self){
                        Text($0.rawValue)                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 16)
                ChosenStatus(selectedStatus: orderTypeSelected)
                
                
            }
            .background(ThemeColor.background.ignoresSafeArea(edges: .bottom))
            .navigationBarTitle(Text("My Orders"))
        }
        
    }
    
}

enum OrderStatus: String, CaseIterable{
    case pending = "Pending"
    case upcoming = "Upcoming"
    case completed = "Completed"
}

struct ChosenStatus: View {
    
    var selectedStatus: OrderStatus
    
    var body: some View {
        switch selectedStatus {
        case .pending:
            ScrollView(.vertical){
                VStack{
                    ForEach (0..<5){_ in
                        PendingCard(name: "James Oliver", productType: "Post", dueDate: "4 Aug 2021").padding([.leading,.trailing], 16)
                    }
                }
            }
            
        case .upcoming:
            ScrollView(.vertical){
                VStack{
                    ForEach (0..<5){_ in
                        OngoingCard(name: "Isabella", productType: "Post", dueDate: "31 October 2021").padding([.leading,.trailing], 16)
                    }
                }
            }
        case .completed:
            ScrollView(.vertical){
                VStack{
                    ForEach (0..<2){_ in
                        CompletedCard(name: "James Charles", productType: "Post", reach: "34K", impression: "3K", engagement: "4.5%").padding([.leading,.trailing], 16)
                    }
                }
                Spacer()
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
