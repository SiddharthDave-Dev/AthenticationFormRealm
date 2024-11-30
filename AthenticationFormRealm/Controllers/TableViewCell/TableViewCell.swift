//
//  TableViewCell.swift
//  AthenticationFormRealm
//
//  Created by EMP on 13/10/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
