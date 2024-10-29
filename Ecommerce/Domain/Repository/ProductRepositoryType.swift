//
//  ProductRepositoryType.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

protocol ProductRepositoryType{
    func getProducts() async -> Result<[Product], EcommerceDomainError>
    func getProductDetail(with id: Int) async -> Result<Product, EcommerceDomainError>
}
