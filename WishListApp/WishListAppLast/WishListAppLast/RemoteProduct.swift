//
//  RemoteProduct.swift
//  WishListAppLast
//
//  Created by 강태영 on 4/20/24.
//

import Foundation

struct RemoteProduct: Decodable {
    var id: Int
    var title: String
    var description: String
    var price: Int
    var discountPercentage: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: URL
    var images: [String]
    
}
