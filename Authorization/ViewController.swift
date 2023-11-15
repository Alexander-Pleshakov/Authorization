//
//  ViewController.swift
//  Authorization
//
//  Created by Александр Плешаков on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var newPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    private func Authorization() -> Bool {
        guard let userName = loginTextField.text,
              let password = passwordTextField.text
        else {
            return false
        }
        
        guard let user = users[userName] else {
            return false
        }
        
        if password == user.password {
            return true
        } else {
            return false
        }
    }
    
    
    @IBAction func buttonLogin(_ sender: Any) {
        infoLabel.text = ""
        let isExist = Authorization()
        if isExist {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(identifier: "StartViewController")
            self.present(viewController, animated: true, completion: nil)
        } else {
            infoLabel.text = "Введен неверный логин или пароль"
        }
        
        view.endEditing(true)
    }
    
}

