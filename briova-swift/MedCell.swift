//
//  MedCell.swift
//  briova-swift
//
//  Created by Patel, Henvy on 10/9/18.
//  Copyright © 2018 Patel, Henvy. All rights reserved.
//

import UIKit
import MGSwipeTableCell
class MedCell: MGSwipeTableCell {

    @IBOutlet weak var MedSelectBtn: UIButton!
   
    @IBOutlet weak var medName: UILabel!
    
    @IBOutlet weak var medImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
