//
//  FavoritesHead.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct FavoritesHead: View {
    @FetchRequest(sortDescriptors: []) var favorites: FetchedResults<TransferCDModel>
    
    var body: some View {
        ZStack {
            if !favorites.isEmpty {
                VStack(alignment: .leading) {
                    HeadingTitle(title: "Favorites")
                        .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
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
        FavoritesHead()
            .environment(\.managedObjectContext, persistance.viewContext)
    }
}
