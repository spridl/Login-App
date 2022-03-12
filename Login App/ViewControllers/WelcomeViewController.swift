//
//  WelcomeViewController.swift
//  Login App
//
//  Created by Тимур on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var fullName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientLayer()
        welcomeLabel.text = "Welcome, \(fullName ?? "")!"
    }
    
    private func setGradientLayer() {
        let startColor = #colorLiteral(red: 0.2569696605, green: 0.7552724481, blue: 0.9694721103, alpha: 1).cgColor
        let endColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.frame = view.frame
        gradientLayer.colors = [startColor, endColor]
    }
}
