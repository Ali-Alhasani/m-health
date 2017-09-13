//
//  MHDiagnoseDetailsTableViewCell.swift
//  m-health
//
//  Created by Ali Al-Hassany on 2/24/17.
//  Copyright © 2017 Ali Al-Hassany. All rights reserved.
//

import UIKit

class MHDiagnoseDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    var title: String? {
        didSet {
            TitleLabel.text = title
        }
    }
    
    var descriptionText: String? {
        didSet {
            DescriptionLabel.text = descriptionText
        }
    }

}
