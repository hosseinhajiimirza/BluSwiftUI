//
//  HomeViewModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import SwiftUI
import CoreData

@MainActor
final class HomeViewModel: ObservableObject {
    @Published private(set) var transfers: HomeResponseModel = []
    @Published private(set) var isGetMoreItemsLoading: Bool = false
    
    private var page: Int = 1
    
    let homeAPIProtocol: HomeAPIProtocol!
    
    init(homeAPIProtocol: HomeAPIProtocol = HomeAPI()) {
        self.homeAPIProtocol = homeAPIProtocol
    }
    
    func getTransferList() async {
        do {
            if let data = try await homeAPIProtocol.getTransferList(page: page) {
                self.transfers.append(contentsOf: data)
                isGetMoreItemsLoading = false
            }
        } catch {
            print("development error - GET Transfer List: \(error)")
        }
    }
    
    func refreshTransferList() {
        Task {
            page = 1
            
            await getTransferList()
        }
    }
    
    func getMoreItems(currentHomeModel: HomeModel) {
        Task {
            if checkIfShouldGetMoreItems(currentHomeModel: currentHomeModel) {
                isGetMoreItemsLoading = true
                page += 1
                
                await getTransferList()
            }
        }
    }
    
    private func checkIfShouldGetMoreItems(currentHomeModel: HomeModel) -> Bool {
        return (checkIfLastItem(currentHomeModel) && transfers.count > ((10 * page) - 1))
    }
    
    func checkIfLastItem(_ currentHomeModel: HomeModel) -> Bool {
        return currentHomeModel.id == transfers.last?.id
    }
    
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
