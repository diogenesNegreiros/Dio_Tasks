import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var labelHora: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var categoryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
