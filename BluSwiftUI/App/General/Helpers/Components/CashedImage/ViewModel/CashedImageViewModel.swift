//
//  CashedImageManager.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import Foundation

final class CashedImageViewModel: ObservableObject {
    @Published private(set) var currentState: CurentState?
    private let imageRetriver: ImageRetriver = .init()
    
    @MainActor
    func load(_ imageURL: String, cashe: ImageCashe = .shared) async {
        self.currentState = .loading
        
        if let imageData = cashe.object(forKey: imageURL as NSString) {
            self.currentState = .success(data: imageData)
            print("🗂️ Fetching image from the cashe with Key:\(imageURL)")
            
            return
        }
        
        do {
            let data = try await imageRetriver.fetch(imageURL)
            self.currentState = .success(data: data)
            cashe.set(object: data as NSData, forKey: imageURL as NSString)
            print("🗂️ Cashing image from the url:\(imageURL)")
        } catch {
            self.currentState = .failed(error: error)
        }
    }
}

extension CashedImageViewModel {
    enum CurentState {
        case loading
        case failed(error: Error)
        case success(data: Data)
    }
}
