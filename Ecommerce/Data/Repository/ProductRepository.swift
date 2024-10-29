//
//  ProductRepository.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation


class ProductRepository: ProductRepositoryType{
    
    private let apiDatasource: APIProductDataSourceType
    
    private let errorMapper: EcommerceDomainErrorMapper
    
    init(apiDatasource: APIProductDataSourceType, errorMapper: EcommerceDomainErrorMapper) {
        self.apiDatasource = apiDatasource
        self.errorMapper = errorMapper
    }
    
    func getProducts() async -> Result<[Product], EcommerceDomainError> {
        let productResult = await apiDatasource.getProducts()
        
        guard case .success(let productList) = productResult else {
            return .failure(errorMapper.map(error: productResult.failureValue as? HTTPClientError))
        }

        let products = productList.map{
            Product(id: $0.id, title: $0.title, price: $0.price, description: $0.description)
        }
        
        return .success(products)
        
    }
    
    func getProductDetail(with id: Int) async -> Result<Product, EcommerceDomainError> {
        let productResult = await apiDatasource.getProductDetail(with: id)
        
        guard case .success(let productData) = productResult else {
            return .failure(errorMapper.map(error: productResult.failureValue as? HTTPClientError))
        }
        
        let product = Product(id: productData.id, title: productData.title, price: productData.price, description: productData.description)
        
        return .success(product)
        
    }
    
}
