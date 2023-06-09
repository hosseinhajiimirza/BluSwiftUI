//
//  FavoritesHead.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct FavoritesHead: View {
    let favorites: FetchedResults<TransferCDModel>
    
    var body: some View {
        ZStack {
            if !favorites.isEmpty {
                VStack(alignment: .leading, spacing: 16) {
                    HeadingTitle(title: "Favorites")
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(favorites) { favorite in
                                HomeTransferFavoriteRow(favoriteModel: favorite)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct FavoritesHead_Previews: PreviewProvider {
    static let persistance = CoreDataViewModel().container
    
    static var previews: some View {
        Home()
            .environment(\.managedObjectContext, persistance.viewContext)
    }
}
