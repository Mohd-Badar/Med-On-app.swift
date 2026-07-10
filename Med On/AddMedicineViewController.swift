//
//  AddMedicineViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

protocol AddMedicineDelegate: AnyObject {
    func didAddMedicine(_ medicine: MedicineModel)
}

class AddMedicineViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: AddMedicineDelegate?

    @IBOutlet weak var repeatView: UIView!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var selectImageBtn: UIButton!
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var medicineNameTextField: UITextField!
    @IBOutlet weak var saveMedicineBtn: UIButton!
    @IBOutlet weak var startDateView: UIView!
    @IBOutlet weak var medicineNameView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var medicineImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        medicineNameView.layer.cornerRadius = 20
        medicineNameView.layer.borderWidth = 1
        medicineNameView.layer.borderColor = UIColor.lightGray.cgColor
        
        startDateView.layer.cornerRadius = 20
        startDateView.layer.borderWidth = 1
        startDateView.layer.borderColor = UIColor.lightGray.cgColor
        
        endDateView.layer.cornerRadius = 20
        endDateView.layer.borderWidth = 1
        endDateView.layer.borderColor = UIColor.lightGray.cgColor
        
        repeatView.layer.cornerRadius = 20
        repeatView.layer.borderWidth = 1
        repeatView.layer.borderColor = UIColor.lightGray.cgColor
        
        timeView.layer.cornerRadius = 20
        timeView.layer.borderWidth = 1
        timeView.layer.borderColor = UIColor.lightGray.cgColor
        
        saveMedicineBtn.layer.cornerRadius = 10
        saveMedicineBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
        
        medicineImageView.layer.cornerRadius = medicineImageView.bounds.height / 2

        // Do any additional setup after loading the view.
    }
    
    func openCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }

    func openGallery() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            medicineImageView.image = image
        } else if let image = info[.originalImage] as? UIImage {
            medicineImageView.image = image
        }
        
        dismiss(animated: true)
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func selectImageBtn(_ sender: Any) {
        
        
           let alert = UIAlertController(title: "Select Image", message: nil, preferredStyle: .actionSheet)
       
           alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
               self.openCamera()
           }))
         
           alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
               self.openGallery()
           }))
        
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
           
           present(alert, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func saveMedicineBtn(_ sender: Any) {
        
        let name = medicineNameTextField.text ?? ""
         
         if name.isEmpty {
             showAlert(msg: "Please enter medicine name")
             return
         }
         
         let time = timePicker.date
         let startDate = startDatePicker.date
         let endDate = endDatePicker.date
         
         var imageData: Data? = nil
         if let image = medicineImageView.image {
             imageData = image.jpegData(compressionQuality: 0.8)
         }
         
         let medicine = MedicineModel(
             name: name,
             time: time,
             startDate: startDate,
             endDate: endDate,
             imageData: imageData
         )
         
         delegate?.didAddMedicine(medicine)
        
         dismiss(animated: true)
    }
}
