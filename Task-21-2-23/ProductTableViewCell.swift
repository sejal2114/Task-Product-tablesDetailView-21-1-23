//
//  ProductTableViewCell.swift
//  Task-21-2-23
//
//  Created by Sejal on 21/02/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var celLTitleLabel: UILabel!
    
    @IBOutlet weak var decriptionLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
