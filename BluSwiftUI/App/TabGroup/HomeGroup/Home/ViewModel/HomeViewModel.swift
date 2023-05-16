//
//  HomeViewModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

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
}
