//
//  UserDescriptionViewController.swift
//  2.28_6_LoginScreen
//
//  Created by Dimondr on 07.07.2022.
//

import UIKit

class UserDescriptionViewController: UIViewController {

    @IBOutlet var navBar: UINavigationItem!
    
    @IBOutlet var userDescription: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDescription.text = person?.description ?? ""
        
        navBar.title = "\(person?.Name ?? "name") \(person?.Surname ?? "surname")"
        
        overrideUserInterfaceStyle = .light
        
    }

}
