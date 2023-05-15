//
//  HomeViewModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var transfers: HomeResponseModel = []
    
    let homeAPIProtocol: HomeAPIProtocol!
    
    init(homeAPIProtocol: HomeAPIProtocol = HomeAPI()) {
        self.homeAPIProtocol = homeAPIProtocol
    }
    
    @MainActor
    func getTransferList(page: Int) async throws {
        do {
            if let data = try await homeAPIProtocol.getTransferList(page: page) {
                self.transfers = data
            }
        } catch let error as RequestError {
            print("development error - GET Transfer List: \(error)")
        }
    }
}
