//
//  Question+CoreDataProperties.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-29.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var answer: String?
    @NSManaged public var questionID: UUID?
    @NSManaged public var text: String?
    @NSManaged public var option1: String?
    @NSManaged public var option2: String?
    @NSManaged public var option3: String?
    @NSManaged public var option4: String?
    @NSManaged public var quiz: Quiz?

}

extension Question : Identifiable {

}
