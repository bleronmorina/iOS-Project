//
//  User+CoreDataProperties.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-29.
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
    @NSManaged public var userID: UUID?
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
