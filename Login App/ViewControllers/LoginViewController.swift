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
    
    private let user = User.getUser()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBar = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBar.viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.fullName = user.person.fullName
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutVC = navigationVC.topViewController as? AboutMeViewController else { return }
                
                aboutVC.navigationItem.title = user.person.fullName
                aboutVC.person = user.person
            }
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            setAlertController(title: "Подсказка 🤫", message: "Имя пользователя: User")
        } else {
            setAlertController(title: "Подсказка 🤫", message: "Пароль: password")
        }
    }
    
    @IBAction func loginButtonPressed() {
        showWelcomeVC()
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showWelcomeVC() {
        if userNameTF.text != user.userName || passwordTF.text != user.password {
            setAlertController(title: "Ошибка 🙀", message: "Неверные имя или пароль")
            passwordTF.text = ""
        } else {
            performSegue(withIdentifier: "segue", sender: nil)
        }
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
            showWelcomeVC()
        }
        return true
    }
}

