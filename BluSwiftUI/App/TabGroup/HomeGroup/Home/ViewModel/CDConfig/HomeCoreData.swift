//
//  HomeCoreData.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI
import CoreData

struct HomeCoreData: HomeCoreDataProtocol {
    func checkIsInFavorites(_ favorites: FetchedResults<TransferCDModel>, homeModel: HomeModel) -> Bool {
        favorites.contains(where: {$0.fullName == homeModel.person.fullName})
    }

    private func addToFavorites(context: NSManagedObjectContext, homeModel: HomeModel) {
        let newFavoriteItem = TransferCDModel(context: context)
        newFavoriteItem.id = homeModel.id
        newFavoriteItem.fullName = homeModel.person.fullName
        newFavoriteItem.email = homeModel.person.email
        newFavoriteItem.url = homeModel.person.avatar
        
        try? context.save()
    }

    private func removeFromFavorites(_ favorites: FetchedResults<TransferCDModel>, context: NSManagedObjectContext, homeModel: HomeModel) {
        if let item = favorites.first(where: {$0.fullName == homeModel.person.fullName}) {
            context.delete(item)
            
            try? context.save()
        }
    }

    func favoriteButtonTapped(favorites: FetchedResults<TransferCDModel>, context: NSManagedObjectContext, homeModel: HomeModel) {
        if checkIsInFavorites(favorites, homeModel: homeModel) {
            removeFromFavorites(favorites, context: context, homeModel: homeModel)
        } else {
            addToFavorites(context: context, homeModel: homeModel)
        }
    }
}
