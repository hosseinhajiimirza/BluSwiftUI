//
//  HomeModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

struct HomeResponseModel: Codable, Identifiable {
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let person = try? keyedCodingContainer.decode(PersonModel.self, forKey: CodingKeys.person) {
            self.person = person
        } else {
            self.person = .init()
        }
        
        if let card = try? keyedCodingContainer.decode(CardModel.self, forKey: CodingKeys.card) {
            self.card = card
        } else {
            self.card = .init()
        }
        
        if let lastTransfer = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.lastTransfer) {
            self.lastTransfer = lastTransfer
        } else {
            self.lastTransfer = ""
        }
        
        if let note = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.note) {
            self.note = note
        } else {
            self.note = ""
        }
        
        if let moreInfo = try? keyedCodingContainer.decode(MoreInfoModel.self, forKey: CodingKeys.moreInfo) {
            self.moreInfo = moreInfo
        } else {
            self.moreInfo = .init()
        }
    }
    
    let id = UUID()
    let person: PersonModel
    let card: CardModel
    let lastTransfer: String
    let note: String
    let moreInfo: MoreInfoModel

    enum CodingKeys: String, CodingKey {
        case person, card
        case lastTransfer = "last_transfer"
        case note
        case moreInfo = "more_info"
    }
}
