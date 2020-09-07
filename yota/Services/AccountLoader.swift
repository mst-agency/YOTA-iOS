//
//  AccountLoader.swift
//  yota
//
//  Created by Victor on 08.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol AccountLoader {
    func loadProfile(callBack: @escaping (Result<Data, ServiceError>) -> Void)
}

final class AccountLoaderImp: NetworkService {

    // MARK: - Property list

    private let profilePath = "/customer/account"
}

extension AccountLoaderImp: AccountLoader {
    func loadProfile(callBack: @escaping (Result<Data, ServiceError>) -> Void) {
        guard let url = URL(string: Endpoint.host + profilePath) else { return callBack(.failure(.wrongURL)) }
        let request = URLRequest(url: url)
        super.load(from: request, callBack: callBack)
    }
}
