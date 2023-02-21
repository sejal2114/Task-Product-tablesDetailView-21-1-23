//
//  Products.swift
//  Task-21-2-23
//
//  Created by Sejal on 21/02/23.
//

import Foundation
import UIKit
struct Roots : Decodable  {
    var products :[Products]
    var total :Int
}
struct Products : Decodable {
    var title : String
    var  price : Double
    var rating : Double
    var thumbnail : String
    var description : String
    var brand : String
}
