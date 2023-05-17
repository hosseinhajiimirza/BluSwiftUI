//
//  HomeMockAPI.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import Foundation

struct HomeMockAPI: HomeAPIProtocol {
    let mockNetworkViewModel: MockNetworkViewModel!
    
    init(mockNetworkViewModel: MockNetworkViewModel = MockNetworkViewModel()) {
        self.mockNetworkViewModel = mockNetworkViewModel
    }
    
    func getTransferList(page: Int = 1) async throws -> HomeResponseModel? {
        if self.mockNetworkViewModel.shouldReturnError {
//            self.mockNetworkViewModel.jsonFileName = JsonFileNames.generalError.rawValue
        } else {
            self.mockNetworkViewModel.jsonFileName = JsonFiles.homeTransferList.rawValue
        }
        
        do {
            return try await mockNetworkViewModel.sendRequest(decodeModel: HomeResponseModel.self)
        } catch let error as RequestError {
            throw error
        }
    }
}
