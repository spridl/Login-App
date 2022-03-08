//
//  WelcomeViewController.swift
//  Login App
//
//  Created by Тимур on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeLabelText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientLayer()
        welcomeLabel.text = welcomeLabelText
    }
    
    private func setGradientLayer() {
        let startColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1).cgColor
        let endColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.frame = view.frame
        gradientLayer.colors = [startColor, endColor]
    }
}
