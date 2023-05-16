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
    // MARK: - Properties
    @Published private(set) var transfers: HomeResponseModel = []
    @Published private(set) var isGetMoreItemsLoading: Bool = false
    @Published private(set) var isTransferListLoading: Bool = false
    
    private var page: Int = 1
    
    let homeAPIProtocol: HomeAPIProtocol!
    let homeCoreDataProtocol: HomeCoreDataProtocol!
    
    init(homeAPIProtocol: HomeAPIProtocol = HomeAPI(), homeCoreDataProtocol: HomeCoreDataProtocol = HomeCoreData()) {
        self.homeAPIProtocol = homeAPIProtocol
        self.homeCoreDataProtocol = homeCoreDataProtocol
    }
    // MARK: - Methods
    // MARK: APIs
    func getTransferList(showLoading: Bool = true) async {
        isTransferListLoading = showLoading
        do {
            if let data = try await homeAPIProtocol.getTransferList(page: page) {
                self.transfers.append(contentsOf: data)
                isGetMoreItemsLoading = false
                isTransferListLoading = false
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
                
                await getTransferList(showLoading: false)
            }
        }
    }
    
    private func checkIfShouldGetMoreItems(currentHomeModel: HomeModel) -> Bool {
        return (checkIfLastItem(currentHomeModel) && transfers.count > ((10 * page) - 1))
    }
    
    func checkIfLastItem(_ currentHomeModel: HomeModel) -> Bool {
        return currentHomeModel.id == transfers.last?.id
    }
    // MARK: Core Data
    func checkIsInFavorites(_ favorites: FetchedResults<TransferCDModel>, homeModel: HomeModel) -> Bool {
        homeCoreDataProtocol.checkIsInFavorites(favorites, homeModel: homeModel)
    }
    
    func favoriteButtonTapped(favorites: FetchedResults<TransferCDModel>, context: NSManagedObjectContext, homeModel: HomeModel) {
        homeCoreDataProtocol.favoriteButtonTapped(favorites: favorites, context: context, homeModel: homeModel)
    }
    
    func getFavoriteButtonSFSymbol(favorites: FetchedResults<TransferCDModel>, homeModel: HomeModel) -> String {
        checkIsInFavorites(favorites, homeModel: homeModel) ? "star.fill" : "star"
    }
}
