//
//  ProductListView.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject private var viewModel: ProductListViewModel
    
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            if viewModel.showLoadingSpinner{
                ProgressView()
                    .progressViewStyle(.circular)
            }else{
                if viewModel.showErrorMessage == nil{
                    NavigationStack{
                        List{
                            ForEach(viewModel.products, id: \.id){ product in
                                VStack(alignment: .leading){
                                    Text(product.title)
                                    Text(product.price.description)
                                }
                            }
                        }
                        .navigationTitle("Productos")
                    }
                }else{
                    Text(viewModel.showErrorMessage!)
                }
            }
        }.onAppear{
            viewModel.onAppear()
        }
    }
}
