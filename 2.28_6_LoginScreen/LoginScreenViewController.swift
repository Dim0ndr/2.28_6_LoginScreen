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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        guard let greetingsVC = segue.destination as? GreetingsViewController else { return  }
        greetingsVC.userName = loginName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    
    @IBAction func loginButtonPressed() {
        
        guard userName.text == loginName, password.text == loginPassword else {
            ShowAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password"
            )
            return
        }

        performSegue(withIdentifier: "showWelcomeVC", sender: nil)

    }
    
    @IBAction func forgetButtonPressed(_ sender: UIButton) {
        sender.tag == 1
            ? ShowAlert(title: "Oops!", message: "Your name is \(loginName) 👈")
            : ShowAlert(title: "Oops!", message: "Your password is \(loginPassword) 👈")
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {

        userName.text = ""
        password.text = ""
    }
}

// MARK: - UIAlertController

extension LoginScreenViewController {
    private func ShowAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.password.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
