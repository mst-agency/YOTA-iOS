//
//  MoneyHeaderViewInput.swift
//  yota
//
//  Created by Victor on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

protocol MoneyHeaderViewInput: MoneyWidgetViewInput {
    
    /// Метод управляет MoneyHeaderView при прокрутке по вертикали.
    func didScroll(scrollView: UIScrollView)
}
