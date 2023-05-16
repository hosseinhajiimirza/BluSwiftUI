//
//  HomeTransferFavoriteRow.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI

struct HomeTransferFavoriteRow: View {
    let favoriteModel: TransferCDModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            HomeTransferRowAvatar(url: favoriteModel.wrappedURL)
                .frame(width: 64, height: 64)
            VStack(alignment: .center, spacing: 4) {
                Text(favoriteModel.wrappedFullName.capitalized)
                    .font(.body)
                    .fontWeight(.medium)
                Text(favoriteModel.wrappedEmail)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
        }
        .lineLimit(1)
        .frame(width: 122)
    }
}

struct HomeTransferFavoriteRow_Previews: PreviewProvider {
    static let persistance = CoreDataViewModel().container
    
    static var previews: some View {
        FavoritesHead()
            .environment(\.managedObjectContext, persistance.viewContext)
    }
}
