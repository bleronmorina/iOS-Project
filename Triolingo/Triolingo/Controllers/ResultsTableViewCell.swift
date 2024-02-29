import UIKit

class ResultsTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!

    func configure(with result: Result) {
        titleLabel.text = result.quizzes?.title
        scoreLabel.text = "Score: \(result.score)"
    }
}
