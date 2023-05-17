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
    
    var toCardNumberFormat: String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        let format = "####\n####\n####\n####"
        for index in 0 ..< format.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: format)
            let patternCharacter = format[stringIndex]
            guard patternCharacter != "#" else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        
        return pureNumber
    }
    
    var toCardNameFormat: String {
        return self.replacingOccurrences(of: " ", with: "\n")
    }
    
    var toISODate: Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime]
        
        return formatter.date(from: self) ?? Date()
    }
    
    func localized(_ comment: String = "", bundle: Bundle = .main) -> String {
        NSLocalizedString(self, bundle: .main, comment: comment)
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
