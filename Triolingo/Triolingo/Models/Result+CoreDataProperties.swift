//
//  Result+CoreDataProperties.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-29.
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

}

extension Result : Identifiable {

}
