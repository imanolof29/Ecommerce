//
//  EcommerceDomainErrorMapper.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

class EcommerceDomainErrorMapper {
    func map(error: HTTPClientError?) -> EcommerceDomainError {
        guard error == .tooManyRequests else {
            return .generic
        }
        
        return .tooManyRequests
    }
}
