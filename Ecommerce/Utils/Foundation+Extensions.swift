//
//  Foundation+Extensions.swift
//  Ecommerce
//
//  Created by Imanol Ortiz on 29/10/24.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
            case .failure(let error):
                return error
            case .success:
                return nil
        }
    }
}
