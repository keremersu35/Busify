//
//  LoginViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 3.04.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    var user = User(username: "noname", password: "noname", email: "noname")
    
    override func viewWillAppear(_ animated: Bool) {
        getUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
    }
}

extension LoginViewController {
    
    func getUser() {
        if let userInfoDict = UserDefaults.standard.dictionary(forKey: Constants.UserDefaultsKeys.userInfo.rawValue) {
            self.user = User(from: userInfoDict)!
        }
    }
    
    func configureTextFields() {
        
        passwordTextField.isSecureTextEntry = true
        if let myImage = UIImage(systemName: Constants.ImageNames.envelope.rawValue){
            mailTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        if let myImage = UIImage(systemName: Constants.ImageNames.lock.rawValue){
            passwordTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        passwordTextField.enablePasswordToggle()
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        
        guard let email = mailTextField.text, !email.isEmpty else {
            mailTextField.layer.borderColor = UIColor.red.cgColor
            mailTextField.layer.borderWidth = 1.0
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0
            return
        }
        
        if (email == user.email && password == user.password) {
            performSegue(withIdentifier: Constants.SegueIdentifiers.loginToTicketSelectionSegue.rawValue, sender: self)
            
        } else {
            showAlert(title: "Error", message: "E-mail or password is invalid")
        }
    }
}




