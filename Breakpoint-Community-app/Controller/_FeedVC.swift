//
//  _FeedVC.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 17.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit

class _FeedVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var _feedTable: UITableView!
    
    // Variables
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _feedTable.delegate = self
        _feedTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self._feedTable.reloadData()
        }
    }
}

extension _FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = _feedTable.dequeueReusableCell(withIdentifier: "_feedRU") as? _FeedTableViewCell else { return UITableViewCell() }
        
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        DataService.instance.getUsername(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        return cell
    }
    
}
