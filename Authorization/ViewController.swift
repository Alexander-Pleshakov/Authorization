//
//  ViewController.swift
//  Authorization
//
//  Created by Александр Плешаков on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var newPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func Authorization() -> Bool {
        guard let userName = loginTextField.text,
              let password = passwordTextField.text
        else {
            return false
        }
        
        let user = UserDefaults.standard.object(forKey: userName) as! User
        
        if password == user.password {
            return true
        } else {
            return false
        }
    }
    
    private func changePassword() {
        
    }
    
    private func registration() {
        
    }
    
    
    @IBAction func buttonLogin(_ sender: Any) {
        let isExist = Authorization()
    }
    
    @IBAction func buttonNewPassword(_ sender: Any) {
        changePassword()
    }
    
    @IBAction func buttonRegistration(_ sender: Any) {
        registration()
    }
    
}

