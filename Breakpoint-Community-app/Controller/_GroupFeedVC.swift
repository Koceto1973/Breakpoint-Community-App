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
    
    var group: Group?
    var groupMessages = [Message]()
    
    func initData(forGroup group: Group) {
        self.group = group
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        messageTextField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // keyboard dismiss
        let tapper = UITapGestureRecognizer(target: self, action:#selector(dismissKeyboard))
        tapper.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapper)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: group?.key, sendComplete: { (complete) in
                if complete {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            })
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}

extension _GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "_groupFeedRU", for: indexPath) as? _GroupFeedTableViewCell else { return UITableViewCell() }
        let message = groupMessages[indexPath.row]
        
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        return cell
    }
}

extension _GroupFeedVC: UITextFieldDelegate {
    // keybord dismissal
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        messageTextField.resignFirstResponder()
    }
}






