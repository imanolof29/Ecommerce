//
//  ProductListFactory.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

class ProductListFactory{
    
    static func create() -> ProductListView{
        return ProductListView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> ProductListViewModel{
        return ProductListViewModel(getProductList: createGetProductListUseCase())
    }
    
    private static func createGetProductListUseCase() -> GetProductListType{
        return GetProductList(repository: createProductRepository())
    }
    
    private static func createProductRepository() -> ProductRepositoryType{
        return ProductRepository(apiDatasource: createAPIProductsDataSource(), errorMapper: EcommerceDomainErrorMapper())
    }
    
    private static func createAPIProductsDataSource() -> APIProductDataSourceType{
        return APIProductDataSource(httpClient: createHTTPClient())
    }
    
    private static func createHTTPClient() -> HTTPClient{
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())
    }
    
}
