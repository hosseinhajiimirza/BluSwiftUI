//
//  ImageCashe.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//

import Foundation

class ImageCashe {
    /// NSString: key(imageURL), NSData: value(imageData)
    typealias CasheType = NSCache<NSString,NSData>
    // We use class and singleton because we need to have only one reference and we don't want to reload the data. if we use struct, It is possible for the cash to reset whenever the view is re-rendered.
    static let shared = ImageCashe()
    // we make the init private, because we don't want anyone to create instances of this class. they can only use shared.
    private init() {}
    
    private lazy var cashe: CasheType = {
        let cashe = CasheType()
        cashe.countLimit = 100
        cashe.totalCostLimit = 50 * 1024 * 1024 // 54228800 Bytes > 50MB
        
        return cashe
    }()
    
    func object(forKey key: NSString) -> Data? {
        cashe.object(forKey: key) as? Data
    }
    
    func set(object: NSData, forKey key: NSString) {
        cashe.setObject(object, forKey: key)
    }
}
