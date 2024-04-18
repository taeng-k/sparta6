//
//  remoteModel.swift
//  WishListApp
//
//  Created by 강태영 on 4/19/24.
//

import Foundation

// URLSession을 통해 가져올 상품의 Decodable Model
struct RemoteProduct: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: URL
    let images: [String]
}
