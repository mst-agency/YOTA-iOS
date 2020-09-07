//
//  CodableService.swift
//  yota
//
//  Created by Anton on 06.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

typealias CodableService = DecoderService & EncoderService

protocol DecoderService {
    func decode<T: Decodable>(from data: Data, model: T.Type, callBack: @escaping (Result<T, ServiceError>) -> Void)
}

protocol EncoderService {
    func encode<T: Encodable>(model: T, callBack: @escaping (Result<Data, ServiceError>) -> Void)
}

final class CodableServiceImp {

    // MARK: - Property list

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

}

// MARK: DecoderService

extension CodableServiceImp: DecoderService {

    func decode<T: Decodable>(from data: Data, model: T.Type, callBack: @escaping (Result<T, ServiceError>) -> Void) {
        do {
            let result = try decoder.decode(model, from: data)
            callBack(.success(result))
        } catch {
            callBack(.failure(.decoding(error)))
        }
    }
}

// MARK: - EncoderService

extension CodableServiceImp: EncoderService {

    func encode<T: Encodable>(model: T, callBack: @escaping (Result<Data, ServiceError>) -> Void) {
        do {
            let data = try encoder.encode(model)
            callBack(.success(data))
        } catch {
            callBack(.failure(.encoding(error)))
        }
    }
}
