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
    @StateObject var updateProfileVM = InfluencerProfileViewModel()
    @State var showUpdateProfile = false
    @State var updateProfileSheet = false
    
    init(){
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ThemeColor.primary)
        UISegmentedControl.appearance().backgroundColor = UIColor(ThemeColor.background)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkGray], for: .normal)
        UINavigationBar.appearance().backgroundColor = UIColor(.clear)
    }
    
    var body: some View {
        
        NavigationView {
            VStack () {
                Picker("", selection: $orderTypeSelected) {
                    ForEach (OrderListStatus.allCases, id: \.self){
                        Text($0.rawValue)                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing], 16)
                .padding(.top, 157)
                
                if showUpdateProfile {
                    Spacer()
                    UpdateProfileInfluencer(showSheet: $updateProfileSheet)
                    Spacer()
                } else {
                    ScrollView {
                        VStack{
                            switch orderTypeSelected {
                            case .incoming:
                                ForEach(orderListVM.incomingOrders, id: \.id) { order in
                                    OrderListCard(orderList: order, status: OrderListStatus.incoming.rawValue)
                                }
                            case .ongoing:
                                ForEach(orderListVM.ongoingOrders, id: \.id) { order in
                                    OrderListCard(orderList: order, status: OrderListStatus.ongoing.rawValue)
                                }
                            case .completed:
                                ForEach(orderListVM.completedOrders, id: \.id) { order in
                                    OrderListCard(orderList: order, status: OrderListStatus.completed.rawValue)
                                }
                            }
                        }
                        .padding()
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Order List")
            .background(Color.init(hex: "F2F2F2"))
            .edgesIgnoringSafeArea(.top)
        }
        .onAppear {
            orderListVM.fetchOrderList()
            userProfile.callData()
            updateProfileVM.callInfluencerData()
            if updateProfileVM.influencerProfile.location == ""{
                showUpdateProfile = true
            }
        }
        .sheet(isPresented: $updateProfileSheet){
            InputProfileView(isPresent: $updateProfileSheet)
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
