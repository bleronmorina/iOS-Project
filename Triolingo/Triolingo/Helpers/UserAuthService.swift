//
//  UserAuthService.swift
//  Triolingo
//
//  Created by user257597 on 2/27/24.
//

import Foundation

class UserAuthService{
    
    static func login(username: String, password: String) -> User? {
        let passwordHashed = SmallServices.sha256(password)
            if let user = UserRepository.getUserByUsername(username) {
                if (user.password == passwordHashed) {
                    let userIdString = user.userID?.uuidString
                    UserDefaults.standard.set(userIdString, forKey: "userID")
                    return user
                }
            } else {
                print("No User found Authentication")
            }
            return nil
        }
    
}
