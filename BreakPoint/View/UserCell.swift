//
//  UserCell.swift
//  BreakPoint
//
//  Created by McKinney family  on 8/19/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    var showing = false
    
    //outlet
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var checkImage: UIImageView!
    
    
    
    
    
    //functions
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkImage.isHidden = false
            
        } else {
            self.checkImage.isHidden = true
        }
    }
    
    
    
    //override func
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
              checkImage.isHidden = false
                showing = true
            } else {
                checkImage.isHidden = true
                showing = false
            
        }
            
        }
        
        
        
        // Configure the view for the selected state
    }

}
