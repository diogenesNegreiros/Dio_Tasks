import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
