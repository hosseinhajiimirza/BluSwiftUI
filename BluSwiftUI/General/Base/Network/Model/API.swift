//
//  API.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

enum API: String {
    case transferList = "transfer-list"

    var method: String {
        switch self {
            // POST:
//        case
//                .signin:
//            return Method.post.rawValue
            // GET:
        case
                .transferList:
            return Method.get.rawValue
//            // PATCH:
//        case
//                .updateWallet:
//            return Method.patch.rawValue
//            // DELETE:
//        case
//                .removeCoinToWatchlist,
//                .deleteAccount:
//            return Method.delete.rawValue
        }
    }
    
    func getBaseURL() -> String {
        return AppConfig.baseURL.rawValue
    }
    
    func getPath(_ input: String = "") -> String {
        return (
            self.rawValue +
            input
        )
        .replacingOccurrences(of: " ", with: "")
    }
}
