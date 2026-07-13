//
//  DeleteMedicineViewController.swift
//  Med On
//
//  Created by Mohd Badar on 10/07/26.
//

import UIKit

class DeleteMedicineViewController: UIViewController {

    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var medicineName: UILabel!
    @IBOutlet weak var medicineImage: UIImageView!
    
    var selectedMedicine: MedicineModel?
    var selectedIndex: Int?

    weak var delegate: DeleteMedicineDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicineImage.layer.cornerRadius = medicineImage.bounds.height / 2
        medicineImage.clipsToBounds = true
        
        deleteBtn.layer.cornerRadius = 10
        deleteBtn.backgroundColor = .systemBlue
        deleteBtn.setTitleColor(.white, for: .normal)
        
        if let data = selectedMedicine {
            medicineName.text = data.name
            
            if let imgData = data.imageData {
                medicineImage.image = UIImage(data: imgData)
            }
        }
    }

    @IBAction func deleteBtn(_ sender: Any) {
        
        if let index = selectedIndex {
               delegate?.didDeleteMedicine(at: index)
           }
           
           dismiss(animated: true)
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
