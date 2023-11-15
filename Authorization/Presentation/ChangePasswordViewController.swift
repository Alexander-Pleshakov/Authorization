//
//  ChangePasswordViewController.swift
//  Authorization
//
//  Created by Александр Плешаков on 15.11.2023.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
        newPasswordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    private func changePassword() {
        guard let login = loginTextField.text,
              let oldPassword = passwordTextField.text,
              let newPassword = newPasswordTextField.text,
              let repeatedPassword = repeatPasswordTextField.text
        else {
            infoLabel.text = "Заполнены не все поля"
            return
        }
        
        if login.isEmpty || oldPassword.isEmpty ||
           newPassword.isEmpty || repeatedPassword.isEmpty {
            infoLabel.text = "Заполнены не все поля"
            return
        }
        
        if let user = users[login] {
            var user = user
            if user.password == oldPassword {
                if newPassword == repeatedPassword {
                    user.password = newPassword
                    users[login] = user
                    infoLabel.textColor = .green
                    infoLabel.text = "Пароль успешно изменен"
                } else {
                    infoLabel.text = "Вы неверно повторили пароль"
                }
            } else {
                infoLabel.text = "Текущий пароль неверен"
            }
        } else {
            infoLabel.text = "Такого логина не существует"
        }
    }
    
    
    @IBAction func buttonChangePassword(_ sender: Any) {
        changePassword()
        
        view.endEditing(true)
    }
}
