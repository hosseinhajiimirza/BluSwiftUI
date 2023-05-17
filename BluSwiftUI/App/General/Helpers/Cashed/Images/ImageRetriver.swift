//
//  ImageRetriver.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import Foundation

struct ImageRetriver {
    func fetch(_ imageURL: String) async throws -> Data {
        guard let url = URL(string: imageURL) else {
            throw RetriverError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
}

private extension ImageRetriver {
    enum RetriverError: Error {
        case invalidURL
    }
}
