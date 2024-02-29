//
//  QuizController.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-29.
//

import CoreData
import UIKit

class QuizRepository {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getQuizzes(difficulty: String) -> [Quiz]? {
        let fetchRequest: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "difficulty == %@", difficulty)
        
        do {
            let quizzes = try context.fetch(fetchRequest)
            return quizzes
        } catch {
            print("Failed to fetch quizzes: \(error)")
            return nil
        }
    }
    
    func addResult(score: Double, quizID: UUID) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        // Fetch the quiz with the given quizID
        let fetchRequest: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "quizID == %@", quizID as CVarArg)
        
        do {
            let quizzes = try context.fetch(fetchRequest)
            
            // Ensure there is exactly one quiz with the given quizID
            guard let quiz = quizzes.first else {
                print("No quiz found with the given ID.")
                return
            }
            
            // Create a new Result entity instance
            let result = Result(context: context)
            
            // Set properties
            result.score = score
            
            // Associate the result with the quiz
            result.quizzes = quiz
            
            // Save to Core Data
            try context.save()
            print("Result saved successfully for quiz: \(quiz.title ?? "")")
        } catch let error as NSError {
            print("Could not save result. \(error), \(error.userInfo)")
        }
    }
    

    func getQuizByID(quizID: UUID) -> Quiz? {
        // Get the app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        // Get the managed object context
        let context = appDelegate.persistentContainer.viewContext
        
        // Create a fetch request for the Quiz entity
        let fetchRequest: NSFetchRequest<Quiz> = Quiz.fetchRequest()
        
        // Set a predicate to filter quizzes by quizID
        fetchRequest.predicate = NSPredicate(format: "quizID == %@", quizID as CVarArg)
        
        do {
            // Execute the fetch request
            let quizzes = try context.fetch(fetchRequest)
            
            // Since quizID is unique, there should be at most one quiz
            return quizzes.first
        } catch {
            print("Failed to fetch quiz: \(error)")
            return nil
        }
    }

}
