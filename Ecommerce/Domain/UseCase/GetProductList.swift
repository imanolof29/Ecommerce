//
//  GetProductList.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

protocol GetProductListType{
    func execute() async -> Result<[Product], EcommerceDomainError>
}

class GetProductList: GetProductListType{
    
    private let repository: ProductRepositoryType
    
    init(repository: ProductRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Product], EcommerceDomainError> {
        let result = await repository.getProducts()
        
        guard let productList = try? result.get() else{
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        return .success(productList)
    }
    
}
