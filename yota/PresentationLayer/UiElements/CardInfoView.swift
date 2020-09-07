//
//  CardInfoView.swift
//  yota
//
//  Created by Victor on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

protocol CardInfoViewable {
    func upadtePaySystem(paySystem: PaySystem)
    func updateAccountNumber(number: String)
}

/// Задает внешний вид CardInfoView
enum CardInfoViewStyle {
    case widget
    case header
}

final class CardInfoView: UIView {
    
    // MARK: - Properties (Public)
    
    var output: MoneyWidgetViewOutput?
    
    // MARK: - Properties (Public)
    
    private var style: CardInfoViewStyle
    
    // MARK: - Properties (Private)
    
    private lazy var paySystem: PaySystemView = {
        let paySystem = PaySystemView()
        paySystem.translatesAutoresizingMaskIntoConstraints = false
        return paySystem
    }()
    
    private lazy var accountNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeRegular(size: 16.0)
        label.text = "* 8878"
        label.textAlignment = .right
        label.textColor = UIColor.Money.title
        label.accessibilityIdentifier = AccessibilityIdentifiers.MoneyModule.cardNumberLabel
        return label
    }()
    
    // MARK: - Initializers (Public)
    
    convenience init(style: CardInfoViewStyle) {
        self.init(frame: .zero)
        self.style = style
        changeStyle(style: self.style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Initializers (Private)
    
    private override init(frame: CGRect) {
        self.style = .widget
        super.init(frame: frame)
        setup()
        changeStyle(style: style)
    }
    
    // MARK: - Methods (Private)
    
    private func setup() {
        
        clipsToBounds = true
        layer.cornerRadius = 13.5
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(paySystem)
        NSLayoutConstraint.activate(
            [paySystem.centerYAnchor.constraint(equalTo: centerYAnchor),
             paySystem.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
             paySystem.heightAnchor.constraint(equalToConstant: 14),
             paySystem.widthAnchor.constraint(equalToConstant: 23)])
        
        addSubview(accountNumber)
        NSLayoutConstraint.activate(
            [accountNumber.centerYAnchor.constraint(equalTo: centerYAnchor),
             accountNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
             accountNumber.heightAnchor.constraint(equalToConstant: 24),
             accountNumber.widthAnchor.constraint(equalToConstant: 49)])
    }
    
    private func changeStyle(style: CardInfoViewStyle) {
        switch style {
        case .header:
            backgroundColor = UIColor.CardIfno.headerBackground
        case .widget:
            backgroundColor = UIColor.CardIfno.wigetBackground
        }
    }
}

// MARK: - CardInfoViewable

extension CardInfoView: CardInfoViewable {
    
    func upadtePaySystem(paySystem: PaySystem) {
        self.paySystem.updatePaySystem(paySystem: paySystem)
    }
    
    func updateAccountNumber(number: String) {
        accountNumber.text = number
    }
}
