//
//  MoreInfoModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

struct MoreInfoModel: Codable {
    init() {
        self.numberOfTransfers = 0
        self.totalTransfer = 0
    }
    
    init(numberOfTransfers: Int, totalTransfer: Int) {
        self.numberOfTransfers = numberOfTransfers
        self.totalTransfer = totalTransfer
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let numberOfTransfers = try? keyedCodingContainer.decode(Int.self, forKey: CodingKeys.numberOfTransfers) {
            self.numberOfTransfers = numberOfTransfers
        } else {
            self.numberOfTransfers = 0
        }
        
        if let totalTransfer = try? keyedCodingContainer.decode(Int.self, forKey: CodingKeys.totalTransfer) {
            self.totalTransfer = totalTransfer
        } else {
            self.totalTransfer = 0
        }
    }
    
    let numberOfTransfers, totalTransfer: Int

    enum CodingKeys: String, CodingKey {
        case numberOfTransfers = "number_of_transfers"
        case totalTransfer = "total_transfer"
    }
}
