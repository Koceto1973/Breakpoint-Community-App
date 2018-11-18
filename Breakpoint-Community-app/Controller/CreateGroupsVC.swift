//
//  CreateGroupsVC.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 17.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    // Outlets
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneBtn: UIButton!
    
    // Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if titleTextField.text != "" && descriptionTextField.text != "" {
            
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreateGroupsVC: UITextFieldDelegate {
    // keybord dismissal
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

