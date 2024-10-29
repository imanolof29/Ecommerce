//
//  ProductDetailViewModel.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

class ProductDetailViewModel: ObservableObject{
    
    private let getProductDetail: GetProductDetailType
    
    let productId: Int
    
    @Published var product: Product?
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    
    init(getProductDetail: GetProductDetailType, productId: Int) {
        self.getProductDetail = getProductDetail
        self.productId = productId
    }
    
    func onAppear(){
        showLoadingSpinner = true
        Task{
            let result = await getProductDetail.execute(with: productId)
            
            guard case .success(let product) = result else{
                handleError(error: result.failureValue as? EcommerceDomainError)
                return
            }
            
            Task{ @MainActor in
                self.showLoadingSpinner = false
                self.product = product
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
