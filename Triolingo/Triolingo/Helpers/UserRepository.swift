//
//  UserRepository.swift
//  Triolingo
//
//  Created by user257597 on 2/27/24.
//

import Foundation
import CoreData
import UIKit

class UserRepository {
    
    public static func getUserByUsername(_ username: String) -> User? {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let users = try! context.fetch(fetchRequest)
        for user in users {
            if (user.username == username){
                print("User found: ")
                return user
            }
        }
        return nil
    }

    public static func getUserByID(_ id: UUID) -> User? {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let users = try! context.fetch(fetchRequest)
        for user in users {
            if (user.userID == id){
                print("User with ID found: ")
                return user
            }
        }
        return nil
    }
    
    public static func getUserByEmail(_ email: String) -> User? {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let users = try! context.fetch(fetchRequest)
        for user in users {
            if (user.email == email){
                print("User found: ")
                return user
            }
        }
        return nil
    }
    
    
}
