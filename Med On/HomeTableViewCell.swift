//
//  HomeTableViewCell.swift
//  Med On
//
//  Created by Mohd Badar on 09/07/26.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.layer.cornerRadius = cellImage.bounds.height / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
