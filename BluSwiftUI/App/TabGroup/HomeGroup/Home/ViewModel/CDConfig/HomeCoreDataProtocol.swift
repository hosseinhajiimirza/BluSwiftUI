//
//  HomeCoreDataProtocol.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import SwiftUI
import CoreData

protocol HomeCoreDataProtocol {
    func checkIsInFavorites(_ favorites: FetchedResults<TransferCDModel>, homeModel: HomeModel) -> Bool
    func favoriteButtonTapped(favorites: FetchedResults<TransferCDModel>, context: NSManagedObjectContext, homeModel: HomeModel)
}
