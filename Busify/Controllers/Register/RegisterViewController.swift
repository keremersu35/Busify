//
//  RegisterViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 3.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
    }
}

extension RegisterViewController {
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
        
        guard let email = mailTextField.text, !email.isEmpty else {
            showAlert(title: "Error", message: "Please provide an email address.")
            return
        }
        
        guard let username = userTextField.text, !username.isEmpty else {
            showAlert(title: "Error", message: "Please provide your name and lastname address.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Error", message: "Please provide a password.")
            return
        }
        
        UserDefaults.standard.set(User(username: username, password: password, email: email).toDictionary(), forKey: Constants.UserDefaultsKeys.userInfo.rawValue)
        performSegue(withIdentifier: Constants.SegueIdentifiers.registerToTicketSelectionSegue.rawValue, sender: self)
    }
    
    func configureTextFields() {
        
        if let myImage = UIImage(systemName: Constants.ImageNames.envelope.rawValue){
            mailTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        if let myImage = UIImage(systemName: Constants.ImageNames.lock.rawValue){
            passwordTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        if let myImage = UIImage(systemName: Constants.ImageNames.person.rawValue){
            userTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
    }
}


