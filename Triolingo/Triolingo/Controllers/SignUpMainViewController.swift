//
//  SignUpMainViewController.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-27.
//

import UIKit

class SignUpMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var name: UITextField!
    @IBOutlet var surname: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var birthday: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpMainToPassword" {
                if let destinationVC = segue.destination as? SignUpPasswordViewController {
                    destinationVC.username = username.text
                    destinationVC.name = name.text
                    destinationVC.surname = surname.text
                    destinationVC.email = email.text
                    destinationVC.birthday = birthday.date
                }
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
