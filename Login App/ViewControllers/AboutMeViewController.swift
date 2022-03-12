//
//  AboutMeViewController.swift
//  Login App
//
//  Created by Тимур on 11.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    var aboutMeText: String!
    var image: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = aboutMeText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        photoVC.photoImage = image
    }
}
