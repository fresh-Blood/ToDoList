//
//  TableViewCell2.swift
//  4
//
//  Created by Admin on 13.10.2021.
//

import UIKit

class TableViewCell2: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var deadLine: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.numberOfLines = 0
        info.numberOfLines = 0
        date.numberOfLines = 0
        deadLine.numberOfLines = 0
        status.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
