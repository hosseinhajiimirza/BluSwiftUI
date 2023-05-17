//
//  CardModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

struct CardModel: Codable {
    init() {
        self.cardNumber = ""
        self.cardType = ""
    }
    
    init(cardNumber: String, cardType: String) {
        self.cardNumber = cardNumber
        self.cardType = cardType
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let cardNumber = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.cardNumber) {
            self.cardNumber = cardNumber
        } else {
            self.cardNumber = ""
        }
        
        if let cardType = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.cardType) {
            self.cardType = cardType
        } else {
            self.cardType = ""
        }
    }
    
    let cardNumber, cardType: String

    enum CodingKeys: String, CodingKey {
        case cardNumber = "card_number"
        case cardType = "card_type"
    }
}
