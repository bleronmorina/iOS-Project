import UIKit

class ChooseQuizViewController: UIViewController {
    
    var difficulty: String!
    var quizzes: [Quiz]!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuizzes()
    }
    
    func loadQuizzes() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let quizRepository = QuizRepository(context: context)
        quizzes = quizRepository.getQuizzes(difficulty: self.difficulty)
        
        // Add buttons for each quiz
        for quiz in quizzes {
            let button = UIButton(type: .system)
            button.layer.backgroundColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 5
            button.titleLabel?.textColor = UIColor.white
            button.setTitle(quiz.title ?? "Untitled Quiz", for: .normal)
            button.addTarget(self, action: #selector(quizButtonTapped(_:)), for: .touchUpInside)
            button.tag = quizzes.firstIndex(of: quiz) ?? 0
            button.frame = CGRect(x: 50, y: 100 + 50 * button.tag, width: 200, height: 40) // Adjust frame as needed
            view.addSubview(button)
        }
    }
    
    @objc func quizButtonTapped(_ sender: UIButton) {
        let selectedQuiz = quizzes[sender.tag]
        performSegue(withIdentifier: "QuizToQuestion", sender: selectedQuiz)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuizToQuestion" {
            if let destinationVC = segue.destination as? QuizQuestionViewController,
               let selectedQuiz = sender as? Quiz {
                destinationVC.difficulty = self.difficulty
                destinationVC.quizTitle = selectedQuiz.title
                destinationVC.currentQuestion = 0
                destinationVC.quizTitle = selectedQuiz.title
                destinationVC.difficulty = selectedQuiz.difficulty
//                destinationVC.result.score = 0
//                destinationVC.quizID = selectedQuiz.quizID
            }
        }
    }
}
