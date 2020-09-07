//
//  InAppWidgetViewInput.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

protocol InAppWidgetViewInput: class {
    func dropContent()
    func displayButtonTitle(title: String)
    func displayInAppContent(text: String)
    func setButtonAction(action: @escaping (() -> Void))
}
