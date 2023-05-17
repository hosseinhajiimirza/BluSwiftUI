//
//  MockNetworkViewModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/17/23.
//

import Foundation

final class MockNetworkViewModel: ObservableObject, AsyncRestServiceProtocol {
    var shouldReturnError: Bool = false
    var requestError: RequestError = .none
    var jsonFileName: String?
    
    func reset() {
        shouldReturnError = false
        self.requestError = .none
    }
    
    func sendRequest<T, U>(urlAPI: API = .getTransferList, isTokenRequired: Bool = true, queryItems: [URLQueryItem]? = nil, decodeModel: U.Type, parameters: T = EmptyModel(), inputToURL: String = "") async throws -> U? where T : Encodable, U : Decodable {
        if shouldReturnError {
//            do {
//                if let jsonFileName, let data = Bundle.main.jsonToData(fileName: jsonFileName) {
//                    let fakeDecodedResponse = try JSONDecoder().decode(String.self, from: data)
//
//                    throw RequestError.emptyData
//                }
//            } catch {
//                throw RequestError.badJson
//            }
        } else {
            do {
                if let jsonFileName, let data = Bundle.main.jsonToData(fileName: jsonFileName) {
                    let fakeDecodedResponse = try JSONDecoder().decode(decodeModel, from: data)
                    return fakeDecodedResponse
                }
            } catch {
                throw RequestError.badJson
            }
        }
        
        return nil
    }
}
