//
//  MyCell.swift
//  UICollection
//
//  Created by Devansh Mohata on 08/09/22.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var levelLabe: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
