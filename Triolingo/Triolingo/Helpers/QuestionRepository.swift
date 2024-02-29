//
//  QuestionRepository.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-29.
//

import Foundation
import UIKit
import CoreData


class QuestionRepository {
    
    func getQuestionsFromQuiz(quizTitle: String, difficulty: String) -> [Question]? {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Assuming you have a managed object context named 'managedObjectContext'

        // Create fetch request for the 'Question' entity
        let fetchRequest: NSFetchRequest<Question> = Question.fetchRequest()

        // Set predicates to filter questions based on quiz title and difficulty
        fetchRequest.predicate = NSPredicate(format: "quiz.title == %@ AND quiz.difficulty == %@", quizTitle, difficulty)

        do {
            // Execute fetch request
            let questions = try context.fetch(fetchRequest)
            return questions
        } catch {
            print("Error fetching questions: \(error.localizedDescription)")
            return nil
        }
    }

    
    
    
}
