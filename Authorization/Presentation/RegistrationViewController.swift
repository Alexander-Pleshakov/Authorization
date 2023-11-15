//
//  RegistrationViewController.swift
//  Authorization
//
//  Created by Александр Плешаков on 15.11.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var patronymic: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var bornPlaceTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    private func registration() -> (Bool, String) {
        view.endEditing(true)
        guard let userName = userNameTextField.text,
           let password = passwordTextField.text,
           let lastName = lastNameTextField.text,
           let firstName = firstNameTextField.text,
           let patronymic = patronymic.text,
           let birthDay = birthDayTextField.text,
           let bornPlace = bornPlaceTextField.text,
           let phone = phoneTextField.text
        else {
            return (false, "Заполните все поля")
        }
        if userName.isEmpty || password.isEmpty || lastName.isEmpty || firstName.isEmpty || patronymic.isEmpty || birthDay.isEmpty || bornPlace.isEmpty || phone.isEmpty {
            return (false, "Заполните все поля")
        }
        else
        {
            let user = User(name: userName,
                            password: password,
                            firstName: firstName,
                            lastName: lastName,
                            patronymic: patronymic,
                            birthDay: birthDay,
                            city: bornPlace,
                            phone: phone)
                
            if let _ = users[userName] {
                return (false, "Пользователь с таким именем уже существует")
            } else {
                users[userName] = user
                return (true, "Вы успешно зарегистрировались")
            }
        }
    }
    
    @IBAction func buttonRegistration(_ sender: Any) {
        infoLabel.text = ""
        let (isRegistration, log) = registration()
        if isRegistration {
            infoLabel.textColor = .green
            infoLabel.text = log
        } else {
            infoLabel.textColor = .red
            infoLabel.text = log
        }
    }
    
}
    
