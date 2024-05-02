//
//  TechieTableViewCell.swift
//  Techie Butler
//
//  Created by Akhil Jain on 01/05/24.
//

import UIKit

class TechieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(data: TechieModel){
        userIdLabel.text = "UserId - " + String(data.userId)
        titleLabel.text = data.title
    }

}
