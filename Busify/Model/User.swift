//
//  User.swift
//  Busify
//
//  Created by Kerem Ersu on 3.04.2023.
//

import Foundation

struct User {
    
    let username: String
    let password: String
    let email: String
    
    init(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "username": username,
            "password": password,
            "email": email
        ]
    }
}

extension User {
    init?(from dictionary: [String: Any]) {
        guard let username = dictionary["username"] as? String,
              let password = dictionary["password"] as? String,
              let email = dictionary["email"] as? String else {
            return nil
        }
        self.init(username: username, password: password, email: email)
    }
}
