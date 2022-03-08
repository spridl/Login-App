//
//  ViewController.swift
//  Login App
//
//  Created by Тимур on 07.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "password"
     
    @IBAction func loginButtonPressed() {
        if userNameTF.text != userName || passwordTF.text != password {
            setAlertController(title: "Ошибка 🙀", message: "Неверные имя или пароль")
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            setAlertController(title: "Подсказка 🤫", message: "Имя пользователя: User")
        } else {
            setAlertController(title: "Подсказка 🤫", message: "Пароль: password")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeLabelText = "Welcome, \(userNameTF.text ?? "")!"
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func setAlertController(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}

