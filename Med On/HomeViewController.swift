//
//  HomeViewController.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit
import UserNotifications

protocol DeleteMedicineDelegate: AnyObject {
    func didDeleteMedicine(at index: Int)
}

struct MedicineModel: Codable {
    var name: String
    var time: Date
    var startDate: Date
    var endDate: Date
    var imageData: Data?
}


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        let data = medicines[indexPath.row]
        
        cell.cellLabel.text = data.name

        
        if let imgData = data.imageData {
            cell.cellImage.image = UIImage(data: imgData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "DeleteMedicineViewController") as! DeleteMedicineViewController
        
        vc.selectedMedicine = medicines[indexPath.row]
        vc.selectedIndex = indexPath.row
        vc.delegate = self
        
        present(vc, animated: true)
    }
    
    func scheduleNotification(medicine: MedicineModel) {
        
        let center = UNUserNotificationCenter.current()
        let calendar = Calendar.current
        
        var currentDate = medicine.startDate
        
        while currentDate <= medicine.endDate {
           
            let content = UNMutableNotificationContent()
            content.title = "Medicine Reminder 💊"
            content.body = "Take \(medicine.name)"
            content.sound = .default
            content.badge = 1
            
            let timeComp = calendar.dateComponents([.hour, .minute], from: medicine.time)
            var dateComp = calendar.dateComponents([.year, .month, .day], from: currentDate)
            
            dateComp.hour = timeComp.hour
            dateComp.minute = timeComp.minute
            
            guard let triggerDate = calendar.date(from: dateComp) else {
                currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
                continue
            }
            
            if triggerDate < Date() {
                print("Skipped past time ❌")
                currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
                continue
            }
          
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
           
            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: trigger
            )
           
            center.add(request) { error in
                if let error = error {
                    print("Error: \(error)")
                } else {
                    print("Notification Scheduled ✅")
                }
            }
            
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
    }
    
    func saveMedicines() {
        do {
            let data = try JSONEncoder().encode(medicines)
            UserDefaults.standard.set(data, forKey: "medicines")
        } catch {
            print("Encoding Error:", error)
        }
    }
    
    func loadMedicines() {
        if let data = UserDefaults.standard.data(forKey: "medicines") {
            do {
                medicines = try JSONDecoder().decode([MedicineModel].self, from: data)
            } catch {
                print("Decoding Error:", error)
            }
        }
    }
    
    
    var medicines: [MedicineModel] = []
    

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
        
        
        loadMedicines()
        
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
        
        let name = UserDefaults.standard.string(forKey: "name")
           
        nameLabel.text = name
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Permission Granted ✅")
            } else {
                print("Permission Denied ❌")
            }
        }

        // Do any additional setup after loading the view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = UserDefaults.standard.string(forKey: "name") ?? "User"
        
        if let data = UserDefaults.standard.data(forKey: "userImage") {
            userImageView.image = UIImage(data: data)
        }
    }
    
    @IBAction func addMedicineBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "AddMedicineViewController") as! AddMedicineViewController
        
        vc.delegate = self
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}

extension HomeViewController: AddMedicineDelegate {
    
    func didAddMedicine(_ medicine: MedicineModel) {
        
        func loadMedicines() {
            if let data = UserDefaults.standard.data(forKey: "medicines") {
                do {
                    medicines = try JSONDecoder().decode([MedicineModel].self, from: data)
                } catch {
                    print("Decoding Error:", error)
                }
            }
        }
        medicines.append(medicine)
        saveMedicines()
        tableView.reloadData()
        
        scheduleNotification(medicine: medicine)
    }
}

extension HomeViewController: DeleteMedicineDelegate {
    
    func didDeleteMedicine(at index: Int) {
        
        medicines.remove(at: index)     
        saveMedicines()
        tableView.reloadData()
    }
}
