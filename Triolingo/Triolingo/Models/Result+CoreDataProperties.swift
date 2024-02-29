//
//  Result+CoreDataProperties.swift
//  Triolingo
//
//  Created by user257597 on 2/28/24.
//
//

import Foundation
import CoreData


extension Result {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Result> {
        return NSFetchRequest<Result>(entityName: "Result")
    }

    @NSManaged public var resultID: UUID?
    @NSManaged public var score: Double
    @NSManaged public var quizzes: Quiz?
    @NSManaged public var users: User?

}

extension Result : Identifiable {

}
