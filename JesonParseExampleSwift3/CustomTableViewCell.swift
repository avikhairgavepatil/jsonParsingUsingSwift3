//
//  CustomTableViewCell.swift
//  JesonParseExampleSwift3
//
//  Created by Admin on 03/09/1939 Saka.
//  Copyright © 1939 Saka Admin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var mainView: UIView!
    
    
    @IBOutlet weak var ImageView: UIImageView!
    

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    
}
