//
//  HomeAPI.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

struct HomeAPI: HomeAPIProtocol {
    let networkViewModel: NetworkViewModel!
    
    init(networkViewModel: NetworkViewModel = NetworkViewModel()) {
        self.networkViewModel = networkViewModel
    }
    
    func getTransferList(page: Int) async throws -> HomeResponseModel? {
        do {
            return try await networkViewModel.sendRequest(urlAPI: API.getTransferList, decodeModel: HomeResponseModel.self, parameters: EmptyModel(), inputToURL: String(page))
        } catch let error as RequestError {
            throw error
        }
    }
}
