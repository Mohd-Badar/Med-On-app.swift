//
//  HomeViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Medicine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell

        cell.cellLabel.text = Medicine[indexPath.row]
        cell.cellImage.image = UIImage(named: Image[indexPath.row])

        return cell
    }
    
    var Medicine = ["Vitamin C", "Vitamin D", "Antibiotic", "Paracitamol", "Vitamin C", "Vitamin D", "Antibiotic", "Paracitamol"]
    var Image = ["greenCapsule", "redCapsule", "yellowCapsule", "greenCapsule", "greenCapsule", "redCapsule", "yellowCapsule", "greenCapsule"]
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bellIconBtn: UIButton!
    @IBOutlet weak var addMedicineBtn: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var progressPercentage: UILabel!
    @IBOutlet weak var medicineTaken: UILabel!
    @IBOutlet weak var hamburgerBtn: UIButton!
    @IBOutlet weak var progressLine: UIProgressView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layer.cornerRadius = 20
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        
        progressView.layer.cornerRadius = 20
        progressView.layer.borderWidth = 1
        progressView.layer.borderColor = UIColor.lightGray.cgColor
        
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
        
        addMedicineBtn.layer.cornerRadius = 10
        addMedicineBtn.backgroundColor = .systemBlue
        
        progressLine.transform = progressView.transform.scaledBy(x: 1, y: 2)
        
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }
    @IBAction func addMedicineBtn(_ sender: Any) {
    }
    
}
