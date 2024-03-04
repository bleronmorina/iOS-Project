import UIKit
import CoreData

class ResultsTableViewController: UITableViewController {

    var results: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResults()
    }

    func fetchResults() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Result> = Result.fetchRequest()
        do {
            self.results = try context.fetch(fetchRequest)
            self.tableView.reloadData()
        } catch {
            print("Error fetching results: \(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultsTableViewCell
        let result = results[indexPath.row]
        // Configure cell with result data
        cell.configure(with: result)
        return cell
    }
}
