//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by McKinney family  on 8/23/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    //outlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
