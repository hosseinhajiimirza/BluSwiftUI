//
//  HashableExtension.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import UIKit

// MARK: - String
extension String {
    public func loadImage() -> UIImage {
        lazy var placeHolderImage: UIImage = UIImage(systemName: "photo")!
        
        do {
            guard let url = URL(string: self) else {
                return placeHolderImage
            }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? placeHolderImage
        } catch {
            print("Loading Image Error")
        }
        
        return placeHolderImage
    }
    
    public var toInt: Int {
        return Int(self) ?? 0
    }
}
// MARK: - Int
extension Int {
    public var toString: String {
        return String(self)
    }
    
    public var toNanoSecends: UInt64 {
        return UInt64(self * 1_000_000_000)
    }
}
// MARK: - Double
extension Double {
    public var toNanoSecends: UInt64 {
        return UInt64(self * 1_000_000_000)
    }
}
