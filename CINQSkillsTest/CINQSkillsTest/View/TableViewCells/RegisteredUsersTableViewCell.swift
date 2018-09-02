//
//  RegisteredUsersTableViewCell.swift
//  CINQSkillsTest
//
//  Created by Luan Audibert on 9/2/18.
//  Copyright © 2018 Luan Audibert. All rights reserved.
//

import UIKit

class RegisteredUsersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    func setupCell(user: User) {
        nameLbl.text = user.name
        emailLbl.text = user.email
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
