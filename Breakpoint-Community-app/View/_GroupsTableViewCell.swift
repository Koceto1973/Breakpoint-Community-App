//
//  _GroupsTableViewCell.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 17.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit

class _GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members."
    }

}
