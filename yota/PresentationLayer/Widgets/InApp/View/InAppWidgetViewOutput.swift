//
//  MoneyWidgetViewOutput.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

protocol InAppWidgetViewOutput {
    var closeAction: (() -> Void)? { get set }
    
    func viewIsReady()
    func tapClose()
}
