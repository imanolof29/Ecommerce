//
//  ProductListViewModel.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

class ProductListViewModel: ObservableObject{
    
    private let getProductList: GetProductListType
    
    @Published var products: [Product] = []
    @Published var showErrorMessage: String?
    @Published var showLoadingSpinner: Bool = false
    
    init(getProductList: GetProductListType) {
        self.getProductList = getProductList
    }
    
    func onAppear(){
        showLoadingSpinner = true
        Task{
            let result = await getProductList.execute()
            
            guard case .success(let products) = result else{
                handleError(error: result.failureValue as? EcommerceDomainError)
                return
            }
            
            Task{ @MainActor in
                showLoadingSpinner = false
                self.products = products
            }
            
        }
    }
    
    private func handleError(error: EcommerceDomainError?){
        Task{ @MainActor in
            showLoadingSpinner = false
            showErrorMessage = error?.localizedDescription
        }
    }
    
}
