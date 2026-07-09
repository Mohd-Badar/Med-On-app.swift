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
        
        nameView.layer.cornerRadius = 20
        nameView.layer.borderWidth = 1
        nameView.layer.borderColor = UIColor.systemBlue.cgColor
        
        numberView.layer.cornerRadius = 20
        numberView.layer.borderWidth = 1
        numberView.layer.borderColor = UIColor.systemBlue.cgColor
        
        emailview.layer.cornerRadius = 20
        emailview.layer.borderWidth = 1
        emailview.layer.borderColor = UIColor.systemBlue.cgColor
        
        passwordView.layer.cornerRadius = 20
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.systemBlue.cgColor
        
        createAccountBtn.layer.cornerRadius = 10
        createAccountBtn.backgroundColor = .systemBlue
        createAccountBtn.tintColor = .white

        // Do any additional setup after loading the view.
    }
    @IBAction func createAccountBtn(_ sender: Any) {
    }
    
}
