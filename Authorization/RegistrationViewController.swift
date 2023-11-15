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
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        
        super.touchesBegan(touches, with: event)
    }
    
    private func registration() -> Bool {
        guard let userName = userNameTextField.text,
           let password = passwordTextField.text,
           let lastName = lastNameTextField.text,
           let firstName = firstNameTextField.text,
           let patronymic = patronymic.text,
           let birthDay = birthDayTextField.text,
           let bornPlace = bornPlaceTextField.text,
           let phone = phoneTextField.text
        else {
            return false
        }
        if userName.isEmpty, password.isEmpty, lastName.isEmpty, firstName.isEmpty, patronymic.isEmpty, birthDay.isEmpty, bornPlace.isEmpty, phone.isEmpty {
            
            return false
        } else {
            let user = User(name: userName,
                            password: password,
                            firstName: firstName,
                            lastName: lastName,
                            patronymic: patronymic,
                            birthDay: birthDay,
                            city: bornPlace,
                            phone: phone)
                
            UserDefaults.standard.set(user, forKey: userName)
            return true
        }
    }
    
    @IBAction func buttonRegistration(_ sender: Any) {
        infoLabel.text = ""
        let isRegistration = registration()
        if isRegistration {
            infoLabel.textColor = .green
            infoLabel.text = "Вы успешно зарегистрировались"
        } else {
            infoLabel.textColor = .red
            infoLabel.text = "Вы пропустили поле"
        }
    }
    
}
    
