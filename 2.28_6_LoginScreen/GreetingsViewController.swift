//
//  ViewController.swift
//  2.28_6_LoginScreen
//
//  Created by Dimondr on 03.07.2022.
//

import UIKit

class GreetingsViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = String("Welcome, \(self.userName)!")
        welcomeLabel.textColor = .white
    }

    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
    
}

