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
    
    private let firstColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    
    private let secondColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGradientLayerOf2(
                firstColor: firstColor,
                secondColor: secondColor,
                startPoint: CGPoint(x: 0, y: 0),
                endPoint: CGPoint(x: 0, y: 1)
        )
        
        welcomeLabel.text = String("Welcome, \(userName)!")
        welcomeLabel.textColor = .white
    }
    
}

// MARK: - Set background color
extension UIView {
    func addGradientLayerOf2(
            firstColor: UIColor,
            secondColor: UIColor,
            startPoint: CGPoint,
            endPoint: CGPoint) {
                
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0, 0.5]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        layer.insertSublayer(gradient, at: 0)
        
    }
}
