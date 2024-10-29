//
//  GetProductDetail.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

protocol GetProductDetailType{
    func execute(with id: Int) async -> Result<Product, EcommerceDomainError>
}


class GetProductDetail: GetProductDetailType{
    
    private let repository: ProductRepositoryType
    
    init(repository: ProductRepositoryType) {
        self.repository = repository
    }
    
    func execute(with id: Int) async -> Result<Product, EcommerceDomainError> {
        let result = await repository.getProductDetail(with: id)
        
        guard let productDetail = try? result.get() else{
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        return .success(productDetail)
    }
    
}
