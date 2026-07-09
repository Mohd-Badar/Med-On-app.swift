//
//  ProfileViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        
        editView.layer.cornerRadius = 20
        editView.layer.borderWidth = 1
        editView.layer.borderColor = UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
    }

    @IBAction func editBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
    @IBAction func logoutBtn(_ sender: Any) {
    }
}
