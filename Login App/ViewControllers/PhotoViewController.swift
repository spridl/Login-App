//
//  PhotoViewController.swift
//  Login App
//
//  Created by Тимур on 11.03.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    var photoImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.layer.cornerRadius = photoImageView.frame.width / 20
        photoImageView.image = UIImage(named: photoImage ?? "")
    }
}
