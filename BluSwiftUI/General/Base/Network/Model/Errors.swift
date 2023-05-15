//
//  Errors.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

enum RequestError: Error, Equatable {
    case badRequest
    case badJson
    case cancellRequest
    case timeOut
    case emptyData
    case serverError
    case badURL
    case connectionLost
    case none
    
    var localerrorText: String {
        switch self{
            
        case .badRequest:
            return "bad request"
            
        case .badJson:
            return "bad json"
            
        case .serverError:
            return "server error"
            
        case .badURL:
            return "bad URL"
            
        case .timeOut:
            return "request timeOut"
            
        case .cancellRequest:
            return "cancellRequest"
            
        case .emptyData:
            return "empty data"
            
        case .connectionLost:
            return "please check your network connection"
            
        case .none:
            return ""
        }
    }
}
