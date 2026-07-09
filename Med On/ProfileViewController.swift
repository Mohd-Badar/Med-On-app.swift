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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = UserDefaults.standard.string(forKey: "name")
        emailLabel.text = UserDefaults.standard.string(forKey: "email")
        numberLabel.text = UserDefaults.standard.string(forKey: "number")
        
        if let data = UserDefaults.standard.data(forKey: "userImage") {
            profileImageView.image = UIImage(data: data)
        }
    }

    @IBAction func editProfileBtn(_ sender: Any) {
    }
    @IBAction func notificationBtn(_ sender: Any) {
    }
    @IBAction func logoutBtn(_ sender: Any) {
        
        let alert = UIAlertController(
                title: "Log Out",
                message: "Are you sure you want to logout?",
                preferredStyle: .alert
            )
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
              
                UserDefaults.standard.removeObject(forKey: "name")
                UserDefaults.standard.removeObject(forKey: "email")
                UserDefaults.standard.removeObject(forKey: "number")
                UserDefaults.standard.removeObject(forKey: "password")
                
                UserDefaults.standard.set(false, forKey: "isLoggedIn")
                
                let vc = self.storyboard?.instantiateViewController(identifier: "CreateAccountViewController") as! CreateAccountViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
         
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(yesAction)
            alert.addAction(cancelAction)
       
            present(alert, animated: true)
    }
    
}

