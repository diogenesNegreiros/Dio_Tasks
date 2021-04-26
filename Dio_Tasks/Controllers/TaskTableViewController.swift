import UIKit

class TaskTableViewController: UITableViewController {
    
    private var tasks: [Task] = []
    
    private var dateFormatter = DateFormatter()
    private var taskRepository = TaskRepository.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tasks = TaskRepository.instance.getTasks()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let task = tasks[indexPath.row]
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        cell.labelDescription.text = task.description
        cell.labelCategory.text = task.category.name
        cell.labelCategory.textColor = .blue
        cell.categoryView.backgroundColor = task.category.color
        cell.labelData.text = dateFormat.string(from: task.date)
        
        dateFormat.dateFormat = "HH:mm"
        cell.labelHora.text = dateFormat.string(from: task.date)
        return cell
    }
}
