//
//  ProfileLoader.swift
//  yota
//
//  Created by Anton on 06.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol ProfileLoader {
    func loadProfile(callBack: @escaping (Result<Data, ServiceError>) -> Void)
    func updateProfile(data: Data, callBack: @escaping (Result<Void, ServiceError>) -> Void)
}

final class ProfileLoaderImp: NetworkService {

    // MARK: - Property list

    private let profilePath = "/customer/profile"
}

extension ProfileLoaderImp: ProfileLoader {

    func loadProfile(callBack: @escaping (Result<Data, ServiceError>) -> Void) {
        guard let url = URL(string: Endpoint.host + profilePath) else { return callBack(.failure(.wrongURL)) }
        let request = URLRequest(url: url)
        super.load(from: request, callBack: callBack)
    }

    func updateProfile(data: Data, callBack: @escaping (Result<Void, ServiceError>) -> Void) {
        guard let url = URL(string: Endpoint.host + profilePath) else { return callBack(.failure(.wrongURL)) }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        super.load(from: request, callBack: { result in
            switch result {
            case .success: callBack(.success( () ))
            case .failure(let error): callBack(.failure(error))
            }
        })
    }
}
