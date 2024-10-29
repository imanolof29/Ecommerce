//
//  APIProductDataSourceType.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

protocol APIProductDataSourceType{
    func getProducts() async -> Result<[ProductDTO], HTTPClientError>
}
