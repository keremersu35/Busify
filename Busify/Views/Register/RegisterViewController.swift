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

        if let myImage = UIImage(systemName: "envelope"){
            mailTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        if let myImage = UIImage(systemName: "lock"){
            passwordTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
        if let myImage = UIImage(systemName: "person"){
            userTextField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.white, colorBorder: UIColor.white)
        }
    }

    @IBAction func registerButtonAction(_ sender: UIButton) {
        
        guard let email = mailTextField.text, !email.isEmpty else {
            showAlert(title: "Error", message: "Please provide an email address.")
            return
        }
        
        guard let username = userTextField.text, !username.isEmpty else {
            showAlert(title: "Error", message: "LPlease provide your name and lastname address.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Error", message: "Please provide a password.")
            return
        }
        
        UserDefaults.standard.set(User(username: username, password: password, email: email).toDictionary(), forKey: "userInfo")
        
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
