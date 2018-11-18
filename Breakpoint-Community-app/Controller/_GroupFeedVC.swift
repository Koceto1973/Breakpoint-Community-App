//
//  _groupFeedVC.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 18.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit
import Firebase

class _GroupFeedVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
