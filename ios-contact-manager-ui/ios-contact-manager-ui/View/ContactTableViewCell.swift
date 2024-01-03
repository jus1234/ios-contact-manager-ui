//
//  ContactTableViewCell.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/3/24.
//

import UIKit

final class ContactTableViewCell: UITableViewCell {
    
    var contact: Contact?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
