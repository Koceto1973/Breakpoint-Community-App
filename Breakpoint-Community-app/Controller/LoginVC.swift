//  LoginVC.swift
//  Breakpoint-Community-app
//
//  Created by K.K. on 16.11.18.
//  Copyright © 2018 K.K. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    self.present(Show.Alert(with : "Successfully logged in user"), animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                    self.present(Show.Alert(with : "Unsuccessfully logged in user"), animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    self.present(Show.Alert(with : "Successfully signed up user"), animated: true, completion: nil)
                } else {
                    print(String(describing: registrationError?.localizedDescription))
                    self.present(Show.Alert(with : "Unsuccessfully signed up user"), animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // keybord dismissal
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
