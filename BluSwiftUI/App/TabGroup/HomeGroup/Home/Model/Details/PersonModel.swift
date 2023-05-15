//
//  PersonModel.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/15/23.
//

import Foundation

struct PersonModel: Codable {
    init() {
        self.fullName = ""
        self.email = ""
        self.avatar = ""
    }
    
    init(fullName: String, email: String, avatar: String) {
        self.fullName = fullName
        self.email = email
        self.avatar = avatar
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let fullName = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.fullName) {
            self.fullName = fullName
        } else {
            self.fullName = "Guest"
        }
        
        if let email = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.email) {
            self.email = email
        } else {
            self.email = "example@email.com"
        }
        
        if let avatar = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.avatar) {
            self.avatar = avatar
        } else {
            self.avatar = ""
        }
    }
    
    let fullName, email: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email, avatar
    }
}
