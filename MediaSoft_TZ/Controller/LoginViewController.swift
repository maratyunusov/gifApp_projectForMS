//
//  ViewController.swift
//  MediaSoft_TZ
//
//  Created by Marat Yunusov on 28.06.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var urlManager = URLManager()
    var ContentVC = ContentViewController()
    
    var accessToken: String?
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        urlManager.delegate = self
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        guard !loginTextField.text!.isEmpty, !passwordTextField.text!.isEmpty else {
            textFieldIsEmpty()
            return
        }
            
        if let login = loginTextField.text, let password = passwordTextField.text {
            urlManager.fetchPasswordGrant(userName: login, userPassword: password)
            sleep(3)
            if let token = self.accessToken {
                if let contentViewController = self.storyboardInstance.instantiateViewController(withIdentifier: "LoginToTableViewController") as? TabBarViewController {
                    contentViewController.accessTokenForContent1 = token
                    self.navigationController?.pushViewController(contentViewController, animated: true)
                }
            } else {
                self.errorAlertShow()
            }
        }
    }
    
}

//MARK: - Login and Password textFields

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        loginTextField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
        
        if passwordTextField.text != "" {
            passwordTextField.endEditing(true)
        }
        return true
    }
}


extension LoginViewController: TokenManagerDelegate {
    
    func errorStatus(error: Error) {
        print(error)
    }
    
    func updateToken(tokenModel: TokenModel) {
        self.accessToken = tokenModel.accessToken
    }
}

extension LoginViewController {
    
    func errorAlertShow() {
        let alert = UIAlertController(title: "Ошибка авторизации!", message: "Проверьте правильность ввода логина и пароля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldIsEmpty() {
        let alert = UIAlertController(title: "Ошибка авторизации!", message: "Введите логин и пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

