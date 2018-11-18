//
//  _GroupsVC.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 17.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit

class _GroupsVC: UIViewController {

    @IBOutlet weak var _groupsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _groupsTable.delegate = self
        _groupsTable.dataSource = self
    }
}

extension _GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = _groupsTable.dequeueReusableCell(withIdentifier: "_groupsRU") as? _GroupsTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
}
