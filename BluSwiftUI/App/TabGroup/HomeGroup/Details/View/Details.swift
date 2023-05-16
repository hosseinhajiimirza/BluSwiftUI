//
//  Details.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct Details: View {
    @ObservedObject var homeViewModel: HomeViewModel
    let homeModel: HomeModel
    let favorites: FetchedResults<TransferCDModel>
    
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 32) {
                    HStack {
                        BluCard(homeModel: homeModel)
                            .offset(x: 32)
                        Spacer(minLength: 0)
                        DetailsPageAvatar(url: homeModel.person.avatar)
                            .offset(x: -32)
                    }
                    TransferInfo(homeModel: homeModel)
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    homeViewModel.favoriteButtonTapped(favorites: favorites, context: moc, homeModel: homeModel)
                } label: {
                    Image(systemName: homeViewModel.getFavoriteButtonSFSymbol(favorites: favorites, homeModel: homeModel))
                        .imageScale(.large)
                        .foregroundColor(.yellow)
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Details_Previews: PreviewProvider {
    static let persistance = CoreDataViewModel().container
    
    static var previews: some View {
        Home()
            .environment(\.managedObjectContext, persistance.viewContext)
    }
}
