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
//        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    
    
    var name: String!
    var username: String!
    var surname: String!
    var email: String!
    var birthday: Date!
    
    
    @IBOutlet var password: UITextField!
    @IBOutlet var passwordConfirmation: UITextField!
    
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {

        let passwordHashed:String! = SmallServices.sha256(password.text!)
        
        let newUser = User(context: self.context)
        newUser.name = name
        newUser.surname = surname
        newUser.email = email
        newUser.userID = UUID()
        newUser.birthday = birthday
        newUser.username = username
        newUser.password = passwordHashed
        
        do {
                try self.context.save()
                print("Data saved successfully")
            
                let userIdString = newUser.userID?.uuidString
                UserDefaults.standard.set(userIdString, forKey: "userID")
                
//                // Navigate to the welcome page
//                let destinationViewController = WelcomePageViewController()
//                navigationController?.pushViewController(destinationViewController, animated: true)
                
            } catch {
                print("Error saving data: \(error)")
            }
        
        let destinationViewController = WelcomePageViewController()
            
        navigationController?.pushViewController(destinationViewController, animated: true)
        
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
