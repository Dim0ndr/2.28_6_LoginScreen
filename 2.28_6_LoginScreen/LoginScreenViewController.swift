//
//  LoginScreenVC.swift
//  2.28_6_LoginScreen
//
//  Created by Dimondr on 03.07.2022.
//

import UIKit

class LoginScreenViewController: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private var person: Person? {

        let users = User.getUsers()

            for user in users {
                if userNameTF.text == user.login && passwordTF.text == user.password {
                    return user.person
                }
            }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        guard let tabBarVC = segue.destination as? UITabBarController else { return  }
        guard let viewControllersTBC = tabBarVC.viewControllers else { return  }
        
        for viewControllerTBC in viewControllersTBC {
            if let viewController = viewControllerTBC as? GreetingsViewController {
                viewController.userName = loginName
                viewController.person = person
            
            } else if let viewController = viewControllerTBC as? UINavigationController {
                viewControllerTBC.title = "\(person?.Name ?? "name") \(person?.Surname ?? "user")"
                let viewControllersNVC = viewController.viewControllers
                
                for viewControllerNVC in viewControllersNVC {
                    if let viewController = viewControllerNVC as? UserInfoViewController {
                        viewController.person = person
                        
                    } else if let viewController = viewControllerNVC as? UserDescriptionViewController {
                        viewController.person = person
                    }
                }
            }
        }

        print("prepare for segue login = ", loginName)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    
    // MARK: - IB Actions
    
    @IBAction func loginButtonPressed() {
        
        guard let person = person else {
            print("Wrong user =", userNameTF.text ?? "")
            ShowAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password"
            )
            return
        }
        
        print("Name successfully checked and =", person.Name)

        performSegue(withIdentifier: "showWelcomeVC", sender: person)

    }
    
    @IBAction func forgetButtonPressed(_ sender: UIButton) {
        sender.tag == 1
            ? ShowAlert(title: "Oops!", message: "Your name is \(loginName) 👈")
            : ShowAlert(title: "Oops!", message: "Your password is \(loginPassword) 👈")
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {

        userNameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - UIAlertController

extension LoginScreenViewController {
    private func ShowAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
