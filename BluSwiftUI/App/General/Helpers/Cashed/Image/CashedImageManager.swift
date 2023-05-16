//
//  CashedImageManager.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import Foundation

final class CashedImageManager: ObservableObject {
    @Published private(set) var data: Data?
    private let imageRetriver: ImageRetriver = .init()
    
    @MainActor
    func load(_ imageURL: String, cashe: ImageCashe = .shared) async {
        if let imageData = cashe.object(forKey: imageURL as NSString) {
            self.data = imageData
            print("🗂️ Fetching image from the cashe with Key:\(imageURL)")
            
            return
        }
        
        do {
            self.data = try await imageRetriver.fetch(imageURL)
            if let dataToCashe = data as? NSData {
                cashe.set(object: dataToCashe, forKey: imageURL as NSString)
                print("🗂️ Cashing image from the url:\(imageURL)")
            }
        } catch {
            print(error)
        }
    }
}
