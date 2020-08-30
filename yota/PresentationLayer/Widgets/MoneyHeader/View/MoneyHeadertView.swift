//
//  MoneyHeaderWidgetView.swift.swift
//  yota
//
//  Created by Victor on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class MoneyHeaderWidgetView: UIView {
    
    // MARK: - Properties (Public)
    
    var output: MoneyWidgetViewOutput?
    
    // MARK: - Properties (Private)
    
    private var heightConstraint: NSLayoutConstraint?
    
    private lazy var balanceTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeRegular(size: 16.0)
        label.text = "Баланс"
        label.textAlignment = .left
        label.textColor = UIColor.Money.title
        return label
    }()
    
    private lazy var cardInfo: CardInfoView = {
        let cardInfo = CardInfoView(style: .header)
        cardInfo.translatesAutoresizingMaskIntoConstraints = false
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapCardInfo))
        cardInfo.addGestureRecognizer(labelTapGesture)
        return cardInfo
    }()
    
    private lazy var balance: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeBold(size: 28.0)
        label.text = "0,8 ₽"
        label.textAlignment = .right
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapBalance))
        label.addGestureRecognizer(labelTapGesture)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    // MARK: - Initializers (Public)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods (Private)
    
    @objc private func handleTapBalance() {
        output?.tapBalanceTriggered()
    }
    
    @objc private func handleTapCardInfo() {
        output?.tapCardInfoTriggered()
    }
    
    private func setup() {
        backgroundColor = UIColor.Money.headerBackground
        
//        clipsToBounds = false
        clipsToBounds = true
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowColor = UIColor(red: 0.263, green: 0.298, blue: 0.369, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cardInfo)
        NSLayoutConstraint.activate(
            [cardInfo.topAnchor.constraint(equalTo: topAnchor, constant: 58),
             cardInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
             cardInfo.heightAnchor.constraint(equalToConstant: 28),
             cardInfo.widthAnchor.constraint(equalToConstant: 96)])
        
        addSubview(balance)
        NSLayoutConstraint.activate(
            [balance.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
             balance.topAnchor.constraint(equalTo: topAnchor, constant: 51),
             balance.leadingAnchor.constraint(greaterThanOrEqualTo: cardInfo.trailingAnchor, constant: 66),
             balance.heightAnchor.constraint(equalToConstant: 41)])
        
        addSubview(balanceTitle)
        NSLayoutConstraint.activate(
            [balanceTitle.topAnchor.constraint(equalTo: topAnchor, constant: 64),
             balanceTitle.trailingAnchor.constraint(equalTo: balance.leadingAnchor, constant: -4),
             balanceTitle.heightAnchor.constraint(equalToConstant: 24),
             balanceTitle.widthAnchor.constraint(equalToConstant: 50)])
        
        heightConstraint = heightAnchor.constraint(equalToConstant: 58)
        heightConstraint?.isActive = true
    }
}

// MARK: - MoneyWidgetViewInput

extension MoneyHeaderWidgetView: MoneyHeaderViewInput {
    
    func scale(value: Double) {
        let maxSize: Double = 107.0
        guard 58 + value <= maxSize else { return }
        
        DispatchQueue.main.async {
            self.heightConstraint?.constant = CGFloat(58 + value)
            self.layoutIfNeeded()
        }
    }
    
    func refreshBalance(balance: NSAttributedString) {
        self.balance.attributedText = balance
    }
    
    func updateCardInfoView(accountNumber: String, paySystem: PaySystem) {
        cardInfo.updateAccountNumber(number: accountNumber)
        cardInfo.upadtePaySystem(paySystem: paySystem)
    }
}
