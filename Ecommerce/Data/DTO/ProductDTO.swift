//
//  ProductDTO.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

struct ProductDTO: Decodable{
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
}
