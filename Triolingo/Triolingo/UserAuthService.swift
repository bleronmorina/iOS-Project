//
//  UserAuthService.swift
//  Triolingo
//
//  Created by user257597 on 2/27/24.
//

import Foundation

class UserAuthService{
    
    static func login(username: String, password: String) -> User? {
            if let user = UserRepository.getUserByUsername(username) {
                if (user.password == password) {
                    return user
                }
            } else {
                print("No User found Authentication")
            }
            return nil
        }
    
}
