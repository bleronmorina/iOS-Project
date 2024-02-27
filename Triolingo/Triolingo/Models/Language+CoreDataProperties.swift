//
//  Language+CoreDataProperties.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-27.
//
//

import Foundation
import CoreData


extension Language {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Language> {
        return NSFetchRequest<Language>(entityName: "Language")
    }

    @NSManaged public var icon: String?
    @NSManaged public var languageID: UUID?
    @NSManaged public var name: String?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension Language {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension Language : Identifiable {

}
