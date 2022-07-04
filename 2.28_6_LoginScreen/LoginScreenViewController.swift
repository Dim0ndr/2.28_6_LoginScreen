//
//  LoginScreenVC.swift
//  2.28_6_LoginScreen
//
//  Created by Dimondr on 03.07.2022.
//

import UIKit

class LoginScreenViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    private let loginName = "Ivan"
    private let loginPassword = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        guard let greetingsVC = segue.destination as? GreetingsViewController else { return  }
        greetingsVC.userName = userName.text ?? ""
        greetingsVC.password = password.text ?? ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    // MARK: - IB Actions
    
    @IBAction func loginButtonPressed() {
        
        print("Try to login with userName:",
              userName.text ?? "",
              "and password:",
              password.text ?? ""
        )
        
        if userName.text != loginName || password.text != loginPassword {
            ShowAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                okTitle: "Try again! 😒 "
            )
            print("Invalid login or password")
        } else { print("Success login") }
    }
    
    @IBAction func forgetUserNameButtonPressed() {
        ShowAlert(title: "Oops!", message: "Your name is \(loginName) 👈", okTitle: "I remember!")
    }
    
    @IBAction func forgetUserButtonPressed() {
        ShowAlert(title: "Oops!", message: "Your password is \(loginPassword) 👈", okTitle: "I know!")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let greetingsVC = segue.source as? GreetingsViewController else { return  }
        userName.text = greetingsVC.userName
        password.text = ""
    }
}

// MARK: - UIAlertController

extension LoginScreenViewController {
    private func ShowAlert(title: String, message: String, okTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
            self.password.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
