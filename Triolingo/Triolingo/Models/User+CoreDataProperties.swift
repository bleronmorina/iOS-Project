//
//  User+CoreDataProperties.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-27.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var surname: String?
    @NSManaged public var username: String?
    @NSManaged public var userID: UUID?
    @NSManaged public var languages: NSSet?
    @NSManaged public var results: Result?

}

// MARK: Generated accessors for languages
extension User {

    @objc(addLanguagesObject:)
    @NSManaged public func addToLanguages(_ value: Language)

    @objc(removeLanguagesObject:)
    @NSManaged public func removeFromLanguages(_ value: Language)

    @objc(addLanguages:)
    @NSManaged public func addToLanguages(_ values: NSSet)

    @objc(removeLanguages:)
    @NSManaged public func removeFromLanguages(_ values: NSSet)

}

extension User : Identifiable {

}
