//
//  LoginViewController.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-26.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var username:UITextField!
    @IBOutlet var password:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func kycuAction (sender: UIButton){
        if let usr = username.text, let pwd = password.text, !usr.isEmpty, !pwd.isEmpty {
            if let user = UserAuthService.login(username: usr, password: pwd) {
                print("Login successful for user: \(user.username ?? "Unknown Username")")
            } else {
                print("Login failed. Invalid username or password.")
            }
        } else {
            print("Username or password is empty.")
        }
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
