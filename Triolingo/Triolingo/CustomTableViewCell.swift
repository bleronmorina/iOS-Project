//
//  CustomTableViewCell.swift
//  Triolingo
//
//  Created by Bleron Morina on 2024-02-26.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var lblName:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
