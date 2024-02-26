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
        var usr:String?
        usr = username.text
        
        var pwd:String?
        pwd = password.text
        
        if(usr == "admin" && pwd=="admin"){
            
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
