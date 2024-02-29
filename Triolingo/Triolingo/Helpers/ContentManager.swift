//
//  CreateQuestions.swift
//  Triolingo
//
//  Created by user257597 on 2/28/24.
//

import Foundation
import CoreData
import UIKit

class ContentManager{
    
    public func createQuestion(context: NSManagedObjectContext, text: String, options: [String], answer: String) -> Question {
        let newQuestion = Question(context: context)
        newQuestion.text = text
        newQuestion.option1 = options.indices.contains(0) ? options[0] : ""
        newQuestion.option2 = options.indices.contains(1) ? options[1] : ""
        newQuestion.option3 = options.indices.contains(2) ? options[2] : ""
        newQuestion.option4 = options.indices.contains(3) ? options[3] : ""
        newQuestion.answer = answer
        newQuestion.questionID = UUID()
        return newQuestion
    }

    
    public func createQuiz(context: NSManagedObjectContext,title: String, difficulty: String)-> Quiz {
        let newQuiz = Quiz(context: context)
        newQuiz.title = title
        newQuiz.quizID = UUID()
        newQuiz.difficulty = difficulty
        return newQuiz
    }

    
    func createAllQuestions() {
 
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Assuming 'context' is your managed object context

        // Fetch the quiz with the specified title and difficulty
        let fetchRequest: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@ AND difficulty == %@", "Nouns", "Hard")

        do {
            let quizzes = try context.fetch(fetchRequest)
            if let existingQuiz = quizzes.first {
                // Delete the existing quiz

                // Create a new quiz
                let newQuiz = createQuiz(context: context, title: "Verbs", difficulty: "Easy")
                newQuiz.addToQuestions(createQuestion(context: context, text: "How do you say 'I am going' in German?", options: ["Ich bin gegangen", "Ich gehe", "Ich gehen", "Ich bin gehen"], answer: "Ich gehe"))
                newQuiz.addToQuestions(createQuestion(context: context, text: "What is the German translation of 'to run'?", options: ["gehen", "springen", "laufen", "fahren"], answer: "laufen"))
                newQuiz.addToQuestions(createQuestion(context: context, text: "What is the German translation of 'to eat'?", options: ["essen", "trinken", "schlafen", "lesen"], answer: "essen"))

                // Save the changes
                try context.save()
                print("New quiz created and saved")
            } else {
                print("Quiz not found")
            }
        } catch {
            print("Error: \(error)")
        }

    }
    
    

}
