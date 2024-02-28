//
//  SignUpPasswordViewController.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-27.
//

import UIKit
import CoreData
import CommonCrypto




class SignUpPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func sha256(_ str: String) -> String {
        if let data = str.data(using: .utf8) {
            var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            data.withUnsafeBytes {
                _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
            }
            return hash.map { String(format: "%02hhx", $0) }.joined()
        }
        return ""
    }
    
    var name: String!
    var username: String!
    var surname: String!
    var email: String!
    var birthday: Date!
    
    
    @IBOutlet var password: UITextInput!
    @IBOutlet var passwordConfirmation: UITextInput!
    
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let password = password.text
        let passwordConfirmation = passwordConfirmation.text
        
        let newUser = User(context: self.context)
        newUser.name = name
        newUser.surname = surname
        newUser.email = email
        newUser.userID = UUID()
        newUser.birthday = birthday
        newUser.password = "kjsdlkj"
        
        try! self.context.save()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
