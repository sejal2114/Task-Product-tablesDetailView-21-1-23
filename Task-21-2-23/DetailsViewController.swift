//
//  DetailsViewController.swift
//  Task-21-2-23
//
//  Created by Sejal on 21/02/23.
//

import UIKit
import SDWebImage
class DetailsViewController: UIViewController {
 
    var product : Products?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = product!.title
        priceLabel.text = "Price: \(product!.price)"
        ratingLabel.text = "Rating: \(product!.rating)"
        
        let url = URL(string:product!.thumbnail)
        productImageView.sd_setImage(with: url)
        
    }
    
    

}
