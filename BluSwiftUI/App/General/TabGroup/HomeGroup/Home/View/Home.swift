//
//  Home.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

struct Home: View {
    @StateObject private var homeViewModel: HomeViewModel
    
    init(homeAPIProtocol: HomeAPIProtocol = HomeAPI()) {
        self._homeViewModel = StateObject(wrappedValue: HomeViewModel(homeAPIProtocol: homeAPIProtocol))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // we can use lazyVStack here.
                ForEach(homeViewModel.transfers) { homeModel in
                    NavigationLink(destination: Color.blue) {
                        HomeTransferRow(homeModel: homeModel)
                    }
                }
            }
            .onAppear {
                Task {
                    try? await homeViewModel.getTransferList(page: 1)
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
