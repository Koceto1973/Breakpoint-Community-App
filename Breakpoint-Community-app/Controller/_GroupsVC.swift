//
//  _GroupsVC.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 17.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit

class _GroupsVC: UIViewController {

    // Outlets
    @IBOutlet weak var _groupsTable: UITableView!
    
    // variables
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _groupsTable.delegate = self
        _groupsTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self._groupsTable.reloadData()
            }
        }
    }
}

extension _GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = _groupsTable.dequeueReusableCell(withIdentifier: "_groupsRU", for: indexPath) as? _GroupsTableViewCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memberCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "_GroupFeedVC") as? _GroupFeedVC else { return }
        groupFeedVC.initData(forGroup: groupsArray[indexPath.row])
        presentDetail(groupFeedVC)
    }
}
