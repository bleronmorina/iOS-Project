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
    
    public func createQuestion(text: String, options: [String], answer: String)-> Question {
        let newQuestion = Question()
        newQuestion.text = text
        let optionsData = try? NSKeyedArchiver.archivedData(withRootObject: options, requiringSecureCoding: false)
        newQuestion.options = optionsData as NSObject?
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
    
    public static func createLanguage(name: String){
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newLanguage = Language(context: context)
        newLanguage.name = name
        newLanguage.languageID = UUID()
        do {
            try context.save()
            print("Data saved successfully")
        }catch {
            print("Error saving data: \(error)")
        }
    }
    
    public func createAllQuestions(){
//        self.createLanguage(name: "German")
    }
}
