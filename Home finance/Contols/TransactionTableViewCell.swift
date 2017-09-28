//
//  TransactionTableViewCell.swift
//  Home finance
//
//  Created by mac6 on 9/28/17.
//  Copyright © 2017 Богдан Гуцул. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionState: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionnameLabel: UILabel!
    @IBOutlet weak var coastLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
