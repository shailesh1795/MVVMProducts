//
//  Product.swift
//  MVVMProducts
//
//  Created by Mac on 16/04/24.
//

import Foundation

struct Product: Decodable {
    
    var id : Int
    var title : String
    var price : Float
    var description : String
    var category : String
    var image : String
    var rating : Rate
}

struct Rate:Decodable {
    
    var rate : Float
    var count : Int
}
