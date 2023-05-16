//
//  Home.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI

struct Home: View {
    @StateObject private var homeViewModel: HomeViewModel
    @Environment(\.managedObjectContext) var moc
    
    init(homeAPIProtocol: HomeAPIProtocol = HomeAPI()) {
        self._homeViewModel = StateObject(wrappedValue: HomeViewModel(homeAPIProtocol: homeAPIProtocol))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    PullToRefresh {
                        homeViewModel.refreshTransferList()
                    }
                    FavoritesHead()
                    VStack(alignment: .leading, spacing: 8) {
                        HeadingTitle(title: "All")
                            .padding(.leading)
                        LazyVStack {
                            ForEach(homeViewModel.transfers) { homeModel in
                                NavigationLink(destination: Color.blue) {
                                    HomeTransferRow(homeModel: homeModel)
                                }
                                .onAppear {
                                    homeViewModel.getMoreItems(currentHomeModel: homeModel)
                                }
                            }
                        }
                    }
                }
            }
            .coordinateSpace(name: CoordinateSpaceName.pullToRefresh.rawValue)
            .onViewDidLoad {
                Task {
                   await homeViewModel.getTransferList()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static let persistance = CoreDataViewModel().container
    
    static var previews: some View {
        Home()
            .environment(\.managedObjectContext, persistance.viewContext)
    }
}
