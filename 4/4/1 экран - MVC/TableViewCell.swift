import UIKit

final class TableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.numberOfLines = 0
        info.numberOfLines = 0
        data.numberOfLines = 0
        deadline.numberOfLines = 0
        status.numberOfLines = 0 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
