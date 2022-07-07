//
//  UserInfoViewController.swift
//  2.28_6_LoginScreen
//
//  Created by Dimondr on 07.07.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet var navBar: UINavigationItem!
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var userSurname: UILabel!
    
    @IBOutlet var userYearOfBirth: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = person?.Name
        userSurname.text = person?.Surname
        userYearOfBirth.text = person?.birthYear?.formatted()
        navBar.title = "\(person?.Name ?? "name") \(person?.Surname ?? "surname")"
        
        self.overrideUserInterfaceStyle = .light
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDescriptionVC = segue.destination as? UserDescriptionViewController else { return }
        userDescriptionVC.person = person
    }
    
    
}
