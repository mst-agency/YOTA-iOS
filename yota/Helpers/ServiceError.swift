//
//  ServiceError.swift
//  yota
//
//  Created by Anton on 06.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case wrongURL
    case sessionError(Error)
    case noHTTPResponse
    case clientError(statusCode: Int)
    case serverError(statusCode: Int)
    case noData
    case decoding(Error)
    case encoding(Error)
}
