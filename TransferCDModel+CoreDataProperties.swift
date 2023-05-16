//
//  TransferCDModel+CoreDataProperties.swift
//  BluSwiftUI
//
//  Created by Hossein Hajimirza on 5/16/23.
//
//

import Foundation
import CoreData


extension TransferCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransferCDModel> {
        return NSFetchRequest<TransferCDModel>(entityName: "TransferCDModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var fullName: String?
    @NSManaged public var email: String?
    @NSManaged public var url: String?

    public var wrappedFullName: String {
        return fullName ?? "No name"
    }
    
    public var wrappedEmail: String {
        return email ?? "No email"
    }
    
    public var wrappedURL: String {
        return url ?? "No URL"
    }
}

extension TransferCDModel : Identifiable {

}
