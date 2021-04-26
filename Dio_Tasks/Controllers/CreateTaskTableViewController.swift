import UIKit

class CreateTaskTableViewController: UITableViewController {
    
    private var datePicker = UIDatePicker()
    private var selectedIndexPath: IndexPath?
    private var dateFormatter = DateFormatter()
    private var taskRepository = TaskRepository.instance
    
    var task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
    }
    
    @IBAction func saveTask(_ sender: Any) {
        taskRepository.save(task: task)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Functions views
    
    func acessoryView() -> UIView {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(datePickerClose))
        toolBar.setItems([space, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        return toolBar
    }
    
    @objc func datePickerClose(){
        
   if let indexPath = self.selectedIndexPath {
            let cell = tableView.cellForRow(at: indexPath) as? DateTableViewCell
            
            if let dateCell = cell {
                dateCell.datetextField.text = dateFormatter.string(from: datePicker.date)
            }
        }
        self.task.date = datePicker.date
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToCategoryTableViewController" {
            let categoriesController = segue.destination as! CategoryTableViewController
            categoriesController.choosenCategory = { category in
                self.task.category = category
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Task name"
        case 1:
            return "Category"
        default:
            return "Date and time"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskDescriptionCell", for: indexPath) as! DescriptionTableViewCell
            cell.taskDescriptionTextField.delegate = self
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
            cell.textLabel?.text = self.task.category.name
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DateTableViewCell
        cell.datetextField.text = dateFormatter.string(from: Date())
        cell.datetextField.inputView = datePicker
        cell.datetextField.inputAccessoryView = acessoryView()
        cell.datetextField.delegate = self
        
        return cell
    }
}

extension CreateTaskTableViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.task.description = textField.text ?? ""
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
  
        let cell = textField.superview?.superview as? DateTableViewCell
        if let dateCell = cell {
            self.selectedIndexPath = tableView.indexPath(for: dateCell)
        }
    }
}
