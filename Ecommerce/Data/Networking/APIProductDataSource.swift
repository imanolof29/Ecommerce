//
//  APIProductDataSource.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

class APIProductDataSource{
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
}

extension APIProductDataSource: APIProductDataSourceType{
    
    func getProducts() async -> Result<[ProductDTO], HTTPClientError> {
        
        let endoint = Endpoint(path: "products", queryParameters: [:], method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endoint, baseUrl: API.baseUrl)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let productList = try? JSONDecoder().decode([ProductDTO].self, from: data) else{
            return .failure(.parsingError)
        }
        
        return .success(productList)
        
    }
 
    func getProductDetail(with id: Int) async -> Result<ProductDTO, HTTPClientError> {
        
        let endpoint = Endpoint(path: "products/\(id)", queryParameters: [:], method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint,  baseUrl: API.baseUrl)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let product = try? JSONDecoder().decode(ProductDTO.self, from: data) else{
            return .failure(.parsingError)
        }

        return .success(product)
        
    }
    
}

extension APIProductDataSource{
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }
            
        return error
    }
}
