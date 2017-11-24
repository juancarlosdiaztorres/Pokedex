//
//  TypeTableViewCell.swift
//  Practica4
//
//  Created by Juan Carlos Díaz Torres on 06/11/2017.
//  Copyright © 2017 Juan Carlos Díaz Torres. All rights reserved.
//

import UIKit

class TypeTableViewCell: UITableViewCell {
    
    
    /*Cell´s parametres*/
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var numberOfRaces: UILabel!
    @IBOutlet weak var typeIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
