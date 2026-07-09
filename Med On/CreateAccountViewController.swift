//
//  CreateAccountViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailview: UIView!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var passwordView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        if isLoggedIn {
            let vc = storyboard?.instantiateViewController(identifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
        
        nameView.layer.cornerRadius = 20
        nameView.layer.borderWidth = 1
        nameView.layer.borderColor = UIColor.lightGray.cgColor
        
        numberView.layer.cornerRadius = 20
        numberView.layer.borderWidth = 1
        numberView.layer.borderColor = UIColor.lightGray.cgColor
        
        emailview.layer.cornerRadius = 20
        emailview.layer.borderWidth = 1
        emailview.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordView.layer.cornerRadius = 20
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        
        createAccountBtn.layer.cornerRadius = 10
        createAccountBtn.backgroundColor = .systemBlue
        createAccountBtn.tintColor = .white

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccountBtn(_ sender: Any) {
        
        let name = nameTextField.text ?? ""
         let email = emailTextField.text ?? ""
         let number = numberTextField.text ?? ""
         let password = passwordTextField.text ?? ""
         
        
         UserDefaults.standard.set(name, forKey: "name")
         UserDefaults.standard.set(email, forKey: "email")
         UserDefaults.standard.set(number, forKey: "number")
         UserDefaults.standard.set(password, forKey: "password")
        
        if name.isEmpty || email.isEmpty || number.isEmpty || password.isEmpty {
              
              let alert = UIAlertController(title: "Error", message: "Please fill all the fields", preferredStyle: .alert)
              
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              
              present(alert, animated: true)
              return
          }
        
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        
        let vc = storyboard?.instantiateViewController(identifier: "TabBarVC") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
}
