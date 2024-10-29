//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @ObservedObject private var viewModel: ProductDetailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            if viewModel.showLoadingSpinner{
                ProgressView()
                    .progressViewStyle(.circular)
            }else{
                if viewModel.showErrorMessage == nil {
                    if let product = viewModel.product{
                        Text(product.title)
                    }else{
                        Text("No product data")
                    }
                }else{
                    Text(viewModel.showErrorMessage!)
                }
            }
        }
        .onAppear{
            viewModel.onAppear()
        }
    }
}
