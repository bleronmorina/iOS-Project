import UIKit

class QuizQuestionViewController: UIViewController {
    
    @IBOutlet var optionButton1: UIButton!
    @IBOutlet var optionButton2: UIButton!
    @IBOutlet var optionButton3: UIButton!
    @IBOutlet var optionButton4: UIButton!
    
    @IBOutlet var nextButton: UIButton!
    
    
    @IBOutlet var question: UILabel!
    
    var selectedOptionButton: UIButton?
    var correctAnswerTag: Int = 1
    
    var quizTitle: String!
    var difficulty: String!
    var quizID: UUID!
    
    var currentQuestion: Int!
    var quizQuestions: [Question]!
    var numOfQuestions: Int!
    
    var result = Result()
    
    var selectedAnswer: String!

    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextQuestion" {
                if let destinationVC = segue.destination as? QuizQuestionViewController {
                    destinationVC.currentQuestion = self.currentQuestion + 1
                    destinationVC.viewDidLoad()
                    destinationVC.difficulty = self.difficulty
                    destinationVC.quizTitle = self.quizTitle
                }
            }
    }

    override func viewDidAppear(_ animated: Bool) {
        print(self.currentQuestion)
        let questionRepository = QuestionRepository()
        quizQuestions = questionRepository.getQuestionsFromQuiz(quizTitle: self.quizTitle, difficulty: self.difficulty)!
        numOfQuestions = quizQuestions.count
        super.viewDidAppear(animated)
        
        optionButton1.setTitle(quizQuestions[self.currentQuestion].option1, for: .normal)
        optionButton2.setTitle(quizQuestions[self.currentQuestion].option2, for: .normal)
        optionButton3.setTitle(quizQuestions[self.currentQuestion].option3, for: .normal)
        optionButton4.setTitle(quizQuestions[self.currentQuestion].option4, for: .normal)
        
        question.text = quizQuestions[self.currentQuestion].text
        
        // Additional setup...
        
        // Add targets to the buttons to handle taps
        optionButton1.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        optionButton2.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        optionButton3.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        optionButton4.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Highlight the correct answer
        if let correctButton = view.viewWithTag(correctAnswerTag) as? UIButton {
            correctButton.layer.borderColor = UIColor.green.cgColor
            correctButton.layer.borderWidth = 2
        }
        
        if currentQuestion == 2 {
            performSegue(withIdentifier: "QuizToResults", sender: self)
//            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//            var quizRepository = QuizRepository(context: context)
//            quizRepository.addResult(score: result.score, quizID: quizID)
          }
        else{
            if(quizQuestions[self.currentQuestion].answer == selectedAnswer){
                result.score = result.score + 1
            }
            performSegue(withIdentifier: "NextQuestion", sender: self)
        }
    }

    @objc func optionButtonTapped(_ sender: UIButton) {
        // Deselect all other buttons
        for button in [optionButton1, optionButton2, optionButton3, optionButton4] {
            if button != sender {
                button?.isSelected = false
                button?.layer.borderWidth = 0
            }
        }
        
        // Select the tapped button
        sender.isSelected = true
        selectedOptionButton = sender
        
        selectedAnswer = selectedOptionButton?.currentTitle
        
        
        // Check if the selected option is correct
        if sender.tag == correctAnswerTag {
            // If the selected option is correct, customize appearance
            sender.layer.borderColor = UIColor.green.cgColor
            sender.layer.borderWidth = 2
        } else {
            // If the selected option is incorrect, customize appearance
            sender.layer.borderColor = UIColor.blue.cgColor
            sender.layer.borderWidth = 4
            
            // Optionally, highlight the correct answer
            if let correctButton = view.viewWithTag(correctAnswerTag) as? UIButton {
                correctButton.layer.borderColor = UIColor.green.cgColor
                correctButton.layer.borderWidth = 2
            }
        }
    }

}

