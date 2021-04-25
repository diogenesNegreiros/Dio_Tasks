import UIKit

let marketingCategory = Category(name: "Marketing", color: UIColor.green)
let comprasCategory = Category(name: "Compras", color: UIColor.blue)

let tasks: [Task] = [
    Task( name: "Publicar no site!", date: Date(), description: "Resultado dos torneios de xadrez da FEXERJ e da CBX realizados no mês de janeiro.", category: marketingCategory),
    Task( name: "Ir ao mercado!", date: Date(), description: "Comprar legumes", category: comprasCategory)
]

class TaskTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
