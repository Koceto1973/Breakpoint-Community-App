//
//  MeVC.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 16.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func logOutBtnPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        
        let remainAction = UIAlertAction(title: "No", style: .default) { (buttonTapped) in
            
        }
        logoutPopup.addAction(remainAction)
        
        let logoutAction = UIAlertAction(title: "Yes", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        
        present(logoutPopup, animated: true, completion: nil)
    }
}





