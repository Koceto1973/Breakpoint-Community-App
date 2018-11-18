//
//  _GroupFeedTableViewCell.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 18.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit

class _GroupFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
