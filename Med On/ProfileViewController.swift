//
//  ProfileViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        
        editView.layer.cornerRadius = 20
        editView.layer.borderWidth = 1
        editView.layer.borderColor = UIColor.lightGray.cgColor
        
        let name = UserDefaults.standard.string(forKey: "name")
         let email = UserDefaults.standard.string(forKey: "email")
         let number = UserDefaults.standard.string(forKey: "number")
         
         nameLabel.text = name
         emailLabel.text = email
         numberLabel.text = number

        // Do any additional setup after loading the view.
    }

    @IBAction func editProfileBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
    @IBAction func logoutBtn(_ sender: Any) {
    }
    
}

