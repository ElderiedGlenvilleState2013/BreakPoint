//
//  GroupCell.swift
//  BreakPoint
//
//  Created by McKinney family  on 8/21/18.
//  Copyright © 2018 FasTek Technologies. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    
    //var or constant
    
    
    
    
    
    
    //outlets
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    
    
    
    
    
    
    
    //ibactions
    
    
    
    //func
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members"
        
        
        
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
