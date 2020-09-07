//
//  MoneyWidgetView.swift
//  yota
//
//  Created by Victor on 26.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class MoneyWidgetView: UIView {
    
    // MARK: - Properties (Public)
    
    var output: MoneyWidgetViewOutput?
    
    // MARK: - Properties (Private)
    
    private lazy var mainTitle: GradientLabel = {
        let label = GradientLabel(frame: .zero)
        label.setGradient(colors:
            [
                UIColor(red: 0.06274509804, green: 0.6823529412, blue: 0.9333333333, alpha: 1),
                UIColor(red: 0.3921568627, green: 0.5098039216, blue: 0.9921568627, alpha: 1)
            ])
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeBold(size: 16.0)
        label.text = "ДЕНЬГИ"
        label.textAlignment = .left
        label.textColor = UIColor.Money.mainTitle
        label.accessibilityIdentifier = AccessibilityIdentifiers.MoneyModule.mainTitleLabel
        return label
    }()
    
    private lazy var balanceTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeRegular(size: 16.0)
        label.text = "Баланс"
        label.textAlignment = .left
        label.textColor = UIColor.Money.title
        label.accessibilityIdentifier = AccessibilityIdentifiers.MoneyModule.widgetBalanceTitleLabel
        return label
    }()
    
    private lazy var cardInfo: CardInfoView = {
        let cardInfo = CardInfoView(style: .widget)
        cardInfo.translatesAutoresizingMaskIntoConstraints = false
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapCardInfo))
        cardInfo.addGestureRecognizer(labelTapGesture)
        return cardInfo
    }()
    
    private lazy var balance: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeBold(size: 28.0)
        label.text = ""
        label.textAlignment = .right
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapBalance))
        label.addGestureRecognizer(labelTapGesture)
        label.isUserInteractionEnabled = true
        label.accessibilityIdentifier = AccessibilityIdentifiers.MoneyModule.widgetBalanceLabel
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
        backgroundColor = UIColor.Money.background
        layer.cornerRadius = 8
        
        clipsToBounds = false
        layer.shadowOpacity = 1
        layer.shadowRadius = layer.cornerRadius
        layer.shadowColor = UIColor(red: 0.263, green: 0.298, blue: 0.369, alpha: 0.1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainTitle)
        NSLayoutConstraint.activate(
            [
                mainTitle.topAnchor.constraint(equalTo: topAnchor, constant: 14),
                mainTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
                mainTitle.heightAnchor.constraint(equalToConstant: 24),
                mainTitle.widthAnchor.constraint(equalToConstant: 64)
            ])
        
        addSubview(cardInfo)
        NSLayoutConstraint.activate(
            [
                cardInfo.topAnchor.constraint(equalTo: topAnchor, constant: 9),
                cardInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
                cardInfo.heightAnchor.constraint(equalToConstant: 28),
                cardInfo.widthAnchor.constraint(equalToConstant: 96)
            ])
        
        addSubview(balanceTitle)
        NSLayoutConstraint.activate(
            [
                balanceTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22),
                balanceTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
                balanceTitle.heightAnchor.constraint(equalToConstant: 24),
                balanceTitle.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        addSubview(balance)
        NSLayoutConstraint.activate(
            [
                balance.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
                balance.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
                balance.leadingAnchor.constraint(greaterThanOrEqualTo: balanceTitle.trailingAnchor, constant: 40),
                balance.heightAnchor.constraint(equalToConstant: 41)
            ])
    }
}

// MARK: - MoneyWidgetViewInput

extension MoneyWidgetView: MoneyWidgetViewInput {
    
    func refreshBalance(balance: NSAttributedString) {
        self.balance.attributedText = balance
    }
    
    func updateCardInfoView(accountNumber: String, paySystem: PaySystem) {
        cardInfo.updateAccountNumber(number: accountNumber)
        cardInfo.upadtePaySystem(paySystem: paySystem)
    }
}
