//
//  NetworkViewModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import UIKit

final class NetworkViewModel: ObservableObject, AsyncRestServiceProtocol {
    @Published public var error: RequestError = .none
    @Published public var userShouldLogIn: Bool = true
    
    fileprivate var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
        
        checkAuth()
    }
    
    func checkAuth() {
        if let token = UserDefaults.standard.string(forKey: "accessToken"), !token.isEmpty {
            self.userShouldLogIn = false
        } else {
            self.userShouldLogIn = true
        }
    }
    
    func logOut() {
        UserDefaults().removeObject(forKey: "accessToken")
        self.userShouldLogIn = true
    }
    
    func setAccessToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "accessToken")
        self.userShouldLogIn = false
    }
    
    @MainActor
    func sendRequest<T: Encodable, U: Decodable>(urlAPI: API, isTokenRequired: Bool = false, queryItems: [URLQueryItem]? = nil, decodeModel: U.Type, parameters: T, inputToURL: String = "") async throws -> U? {
        //        guard let url = URL(string: urlAPI.getPath(inputToURL).replacingOccurrences(of: " ", with: "")) else { throw RequestError.badURL }
        var urlComponents = URLComponents(string: urlAPI.getBaseURL())
        urlComponents?.path = urlAPI.getPath(inputToURL)
        urlComponents?.queryItems = queryItems
        
        if isTokenRequired && userShouldLogIn {
            return nil
        }
        
        guard let url = urlComponents?.url else { throw RequestError.badURL }
        //
        var request = URLRequest(url: url)
        
        request.httpMethod = urlAPI.method
        //        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if isTokenRequired {
            if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
                request.setValue(accessToken, forHTTPHeaderField: "token")
            }
        }
        
        if request.httpMethod == Method.get.rawValue {
            request.httpBody = nil
        } else {
            let jsonData = try? JSONEncoder().encode(parameters)
            request.httpBody = jsonData
        }
        
        let (data, response) = try await session.data(for: request)
        print("sent to url: \(url)")
        
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...299:
                do {
                    let apiResponse = try JSONDecoder().decode(decodeModel, from: data)
                    dump(apiResponse)
                    
                    return apiResponse
                } catch {
                    // we can use this error if we only use EnvironmentObject:
                    self.error = .badJson
                    
                    throw RequestError.badJson
                }
                
            case 400...499:
                //refresh token
                if httpResponse.statusCode == 401 {
                    // Error Handling
                }
                
                //                do {
                //                    // Error Handling
                //                } catch {
                //                    self.error = .badJson
                //
                //                    throw RequestError.badJson
                //                }
                
            case 500:
                // Some Logics...
                self.error = .serverError
                
                throw RequestError.serverError
            default:
                self.error = .serverError
                
                throw RequestError.serverError
            }
        }
        
        return nil
    }
}
