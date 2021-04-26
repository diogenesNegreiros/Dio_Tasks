import UIKit

class CreateTaskTableViewController: UITableViewController, UITextFieldDelegate {
    
    var datePicker: UIDatePicker = UIDatePicker()
    var selectedIndexPath: IndexPath?
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        }
    
    @IBAction func saveTask(_ sender: Any) {
        print("task saved!")
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
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let cell = textField.superview?.superview as? DateTableViewCell
        if let cellDate = cell {
            self.selectedIndexPath = tableView.indexPath(for: cellDate)
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
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DateTableViewCell
        cell.datetextField.delegate = self
        cell.datetextField.inputView = datePicker
        cell.datetextField.inputAccessoryView = acessoryView()
       
        return cell
    }
}
