//
//  AddMedicineViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

class AddMedicineViewController: UIViewController {

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
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    @IBAction func saveMedicineBtn(_ sender: Any) {
    }
}
