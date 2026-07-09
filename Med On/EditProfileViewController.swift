//
//  EditProfileViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var emailview: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var changeImageBtn: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var nameView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.string(forKey: "name")
         let email = UserDefaults.standard.string(forKey: "email")
         let number = UserDefaults.standard.string(forKey: "number")
         
         nameTextField.text = name
         emailTextField.text = email
         numberTextField.text = number
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        
        nameView.layer.cornerRadius = 20
        nameView.layer.borderWidth = 1
        nameView.layer.borderColor = UIColor.lightGray.cgColor
        
        numberView.layer.cornerRadius = 20
        numberView.layer.borderWidth = 1
        numberView.layer.borderColor = UIColor.lightGray.cgColor
        
        emailview.layer.cornerRadius = 20
        emailview.layer.borderWidth = 1
        emailview.layer.borderColor = UIColor.lightGray.cgColor
        
        saveBtn.layer.cornerRadius = 10
        saveBtn.layer.backgroundColor = UIColor.systemBlue.cgColor

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.editedImage] as? UIImage {
            profileImageView.image = selectedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            profileImageView.image = originalImage
        }
        
        dismiss(animated: true)
    }
    
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let name = nameTextField.text ?? ""
          let email = emailTextField.text ?? ""
          let number = numberTextField.text ?? ""
         
          UserDefaults.standard.set(name, forKey: "name")
          UserDefaults.standard.set(email, forKey: "email")
          UserDefaults.standard.set(number, forKey: "number")
        
          if let image = profileImageView.image,
             let data = image.jpegData(compressionQuality: 0.8) {
              UserDefaults.standard.set(data, forKey: "userImage")
          }
          
          navigationController?.popViewController(animated: true)
        
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let data = UserDefaults.standard.data(forKey: "userImage") {
            profileImageView.image = UIImage(data: data)
        }
    }
    
    
    @IBAction func changeImageBtn(_ sender: Any) {
        
        let picker = UIImagePickerController()
           picker.sourceType = .photoLibrary
           picker.delegate = self
           picker.allowsEditing = true
           
           present(picker, animated: true)
    }
    
}
