//
//  Endpoint.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

struct Endpoint {
    let path: String
    let queryParameters: [String : Any]
    let method: HTTPMethod
}
