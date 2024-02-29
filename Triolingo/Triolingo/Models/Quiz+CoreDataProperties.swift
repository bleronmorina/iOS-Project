//
//  Quiz+CoreDataProperties.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-29.
//
//

import Foundation
import CoreData


extension Quiz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quiz> {
        return NSFetchRequest<Quiz>(entityName: "Quiz")
    }

    @NSManaged public var difficulty: String?
    @NSManaged public var quizID: UUID?
    @NSManaged public var title: String?
    @NSManaged public var questions: NSSet?
    @NSManaged public var results: Result?

}

// MARK: Generated accessors for questions
extension Quiz {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Question)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Question)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}

extension Quiz : Identifiable {

}
