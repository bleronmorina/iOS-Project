//
//  UserRepository.swift
//  Triolingo
//
//  Created by user257597 on 2/27/24.
//

import Foundation
import CoreData

class UserRepository {
    
    static func getUserByUsername(_ username: String) -> User? {
            let context = CoreDataManager.shared.persistentContainer.viewContext

            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@", username)

            do {
                let users = try context.fetch(fetchRequest)
                return users.first
            } catch {
                print("Error fetching user by username: \(error.localizedDescription)")
                return nil
            }
        }
}
