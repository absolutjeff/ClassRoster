//
//  personTableViewCell.swift
//  Class Roster
//
//  Created by Jeff Hendershot on 11/24/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var tableViewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
