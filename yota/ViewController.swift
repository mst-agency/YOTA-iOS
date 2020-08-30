//
//  ViewController.swift
//  yota
//
//  Created by Dexter on 24.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let moneyView = MoneyWidgetView(frame: .zero)
    let moneyHeaderView = MoneyHeaderWidgetView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        let conf = MoneyModuleConfigurator()
        conf.configureModuleForViewInput(viewInput: moneyView, headerViewInput: moneyHeaderView)

        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9333333333, blue: 0.9529411765, alpha: 1)
        moneyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moneyView)
        NSLayoutConstraint.activate(
            [moneyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
             moneyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
             moneyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
             moneyView.heightAnchor.constraint(equalToConstant: 110)])
        
        moneyHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moneyHeaderView)
        NSLayoutConstraint.activate(
            [moneyHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
             moneyHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
             moneyHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
             moneyHeaderView.heightAnchor.constraint(equalToConstant: 107)])
        
    }
}
