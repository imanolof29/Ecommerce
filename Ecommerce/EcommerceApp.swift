//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import SwiftUI

@main
struct EcommerceApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListFactory.create()
        }
    }
}
