//
//  GetCustomerAccountDataStub.swift
//  yota
//
//  Created by Victor on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation
@testable import yota

class GetCustomerAccountDataStub: GetCustomerAccountDataUseCase {

    var data: CardInfo!
    
    func getData() -> CardInfo {
        return data
    }
}
