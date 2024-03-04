//
//  ChooseDifficultyViewController.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-29.
//

import UIKit

class ChooseDifficultyViewController: UIViewController {
    
    var chosenDifficulty: String!
    
    @IBOutlet var easyButton:UIButton!
    @IBOutlet var mediumButton:UIButton!
    @IBOutlet var hardButton:UIButton!
    
    
    @IBAction func easyButtonTapped(_ sender: UIButton) {
            chosenDifficulty = "Easy"
            performSegue(withIdentifier: "DifficultyToQuiz", sender: self)
        }
        
    @IBAction func mediumButtonTapped(_ sender: UIButton) {
            chosenDifficulty = "Medium"
            performSegue(withIdentifier: "DifficultyToQuiz", sender: self)
        }
        
    @IBAction func hardButtonTapped(_ sender: UIButton) {
            chosenDifficulty = "Hard"
            performSegue(withIdentifier: "DifficultyToQuiz", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DifficultyToQuiz" {
                if let destinationVC = segue.destination as? ChooseQuizViewController {
                    destinationVC.difficulty = self.chosenDifficulty
                }
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
