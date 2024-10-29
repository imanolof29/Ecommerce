//
//  ProductDetailFactory.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

class ProductDetailFactory{
    
    static func create(id: Int) -> ProductDetailView{
        return ProductDetailView(viewModel: createViewModel(id: id))
    }
    
    private static func createViewModel(id: Int) -> ProductDetailViewModel{
        return ProductDetailViewModel(getProductDetail: createGetProductDetailUseCase(), productId: id)
    }
    
    private static func createGetProductDetailUseCase() -> GetProductDetailType{
        return GetProductDetail(repository: createRepository())
    }
    
    private static func createRepository() -> ProductRepositoryType{
        return ProductRepository(apiDatasource: createProductDataSource(), errorMapper: EcommerceDomainErrorMapper())
    }
    
    private static func createProductDataSource() -> APIProductDataSourceType{
        return APIProductDataSource(httpClient: createHTTPClient())
    }
    
    private static func createHTTPClient() -> HTTPClient{
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())
    }
    
}
