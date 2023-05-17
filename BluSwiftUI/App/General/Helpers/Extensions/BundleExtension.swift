//
//  BundleExtension.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

extension Bundle {
    func decodeFromJSON<T: Decodable>(fileName: String) -> T {
        guard let url = self.url(forResource: "\(fileName).json", withExtension: nil) else {
            fatalError("Could not find the resource: \(fileName)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load data from the resource file: \(fileName)")
        }
        
        guard let loadedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Could not decode data from the resource file: \(fileName)")
        }
        
        return loadedData
    }
    
    /// jsonToData is a method to find the path and read json data from bundle.
    func jsonToData(fileName: String) -> Data? {
        guard let url = self.url(forResource: fileName, withExtension: "json") else {
            fatalError("Could not find the resource: \(fileName)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load data from the resource file: \(fileName)")
        }
        
        return data
    }
}
