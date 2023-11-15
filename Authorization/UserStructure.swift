//
//  UserStructure.swift
//  Authorization
//
//  Created by Александр Плешаков on 15.11.2023.
//

import Foundation

public var users: [String: User] = ["sasha": User(name: "sasha", password: "1234", firstName: "", lastName: "", patronymic: "", birthDay: "", city: "", phone: "")]

public struct User {
    
    public let name: String
    
    public var password: String
    public var firstName: String
    public var lastName: String
    public var patronymic: String
    public var birthDay: String
    public var city: String
    public var phone: String
    
}


