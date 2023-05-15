//
//  AsyncRestServiceProtocol.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

protocol AsyncRestServiceProtocol: AnyObject {
    func sendRequest<T: Encodable, U: Decodable>(urlAPI: API, isTokenRequired: Bool, queryItems: [URLQueryItem]?, decodeModel: U.Type, parameters: T, inputToURL: String) async throws -> U?
}
