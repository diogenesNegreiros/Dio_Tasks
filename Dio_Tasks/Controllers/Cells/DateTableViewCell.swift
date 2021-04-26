import UIKit

class DateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var datetextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
