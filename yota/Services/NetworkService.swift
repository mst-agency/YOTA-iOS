//
//  NetworkService.swift
//  yota
//
//  Created by Anton on 06.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

class NetworkService {

    struct Endpoint {
        static let host = ""
    }

    final func load(from request: URLRequest, callBack: @escaping (Result<Data, ServiceError>) -> Void ) {
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error { callBack(.failure(.sessionError(error))) }
            guard let response = response as? HTTPURLResponse else { return callBack(.failure(.noHTTPResponse)) }
            switch response.statusCode {
            case 400...500: callBack(.failure(.clientError(statusCode: response.statusCode)))
            case 500...600: callBack(.failure(.serverError(statusCode: response.statusCode)))
            default: break
            }
            guard let data = data else { return callBack(.failure(.noData)) }
            callBack(.success(data))
        }).resume()
    }
}
