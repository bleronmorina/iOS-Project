//
//  WelcomePageViewController.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-28.
//

import UIKit

class WelcomePageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userId = UserDefaults.standard.string(forKey: "userID") {
            let uuid = UUID(uuidString: userId)!
            
            
        } else {
            print("User ID not found")
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
