//
//  CustomeCell.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 07/06/22.
//

import UIKit

class CustomeCell: UITableViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var emailLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
