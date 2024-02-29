//
//  Quiz+CoreDataProperties.swift
//  Triolingo
//
//  Created by user257597 on 2/28/24.
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
    @NSManaged public var language: NSSet?
    @NSManaged public var questions: NSSet?
    @NSManaged public var results: Result?

}

// MARK: Generated accessors for language
extension Quiz {

    @objc(addLanguageObject:)
    @NSManaged public func addToLanguage(_ value: Language)

    @objc(removeLanguageObject:)
    @NSManaged public func removeFromLanguage(_ value: Language)

    @objc(addLanguage:)
    @NSManaged public func addToLanguage(_ values: NSSet)

    @objc(removeLanguage:)
    @NSManaged public func removeFromLanguage(_ values: NSSet)

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
