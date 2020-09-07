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
    
    var output: MoneyHeaderViewOutput?
    
    // MARK: - Properties (Private)
    
    private var heightConstraint: NSLayoutConstraint?
    
    private var oldContentOffset = CGPoint.zero
    private let minHeight: CGFloat = WidgetSize.moneyHeaderViewWidgetHeightRange().lowerBound
    private let maxHeight: CGFloat = WidgetSize.moneyHeaderViewWidgetHeightRange().upperBound
    
    private lazy var mainView: UIView = {
        let mainView = UIView(frame: frame)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = UIColor.Money.headerBackground
        return mainView
    }()
    
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
    
    private func shadowOff() {
        layer.shadowOpacity = 0
    }
    
    private func shadowOn() {
        layer.shadowOpacity = 1
    }
    
    private func setup() {
        backgroundColor = UIColor.Money.headerBackground
        
        clipsToBounds = false
        mainView.clipsToBounds = true
        
        layer.shadowOpacity = 0
        layer.shadowRadius = 10
        layer.shadowColor = UIColor(red: 0.263, green: 0.298, blue: 0.369, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
      
        translatesAutoresizingMaskIntoConstraints = false
       
        addSubview(mainView)
        NSLayoutConstraint.activate(
            [
                mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
                mainView.topAnchor.constraint(equalTo: topAnchor),
                mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
                mainView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        mainView.addSubview(cardInfo)
        NSLayoutConstraint.activate(
            [cardInfo.topAnchor.constraint(equalTo: topAnchor, constant: 58),
             cardInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
             cardInfo.heightAnchor.constraint(equalToConstant: 28),
             cardInfo.widthAnchor.constraint(equalToConstant: 96)])
        
        mainView.addSubview(balance)
        NSLayoutConstraint.activate(
            [balance.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
             balance.topAnchor.constraint(equalTo: topAnchor, constant: 51),
             balance.leadingAnchor.constraint(greaterThanOrEqualTo: cardInfo.trailingAnchor, constant: 66),
             balance.heightAnchor.constraint(equalToConstant: 41)])
        
        mainView.addSubview(balanceTitle)
        NSLayoutConstraint.activate(
            [balanceTitle.topAnchor.constraint(equalTo: topAnchor, constant: 64),
             balanceTitle.trailingAnchor.constraint(equalTo: balance.leadingAnchor, constant: -4),
             balanceTitle.heightAnchor.constraint(equalToConstant: 24),
             balanceTitle.widthAnchor.constraint(equalToConstant: 50)])
        
        heightConstraint = heightAnchor.constraint(equalToConstant: minHeight)
        
        heightConstraint?.isActive = true
    }
}

// MARK: - MoneyWidgetViewInput

extension MoneyHeaderWidgetView: MoneyHeaderViewInput {
    
    func didScroll(scrollView: UIScrollView) {
        guard let heightConstraint = self.heightConstraint else { return }
        
        let contentOffset =  scrollView.contentOffset.y - oldContentOffset.y
        
        if contentOffset > 0 && scrollView.contentOffset.y > -minHeight {
            if heightConstraint.constant <= maxHeight {
                if heightConstraint.constant + contentOffset <= maxHeight {
                    heightConstraint.constant += contentOffset
                    shadowOn()
                } else {
                    heightConstraint.constant = maxHeight
                }
            }
        }
        
        if contentOffset < 0 && scrollView.contentOffset.y <= -minHeight + maxHeight - minHeight {
            if heightConstraint.constant > minHeight {
                if heightConstraint.constant + contentOffset >= minHeight {
                    heightConstraint.constant += contentOffset
                } else {
                    heightConstraint.constant = minHeight
                }
            
            }
        }
        
        if heightConstraint.constant == minHeight {
             shadowOff()
        }

        oldContentOffset = scrollView.contentOffset
    }
    
    func refreshBalance(balance: NSAttributedString) {
        self.balance.attributedText = balance
    }
    
    func updateCardInfoView(accountNumber: String, paySystem: PaySystem) {
        cardInfo.updateAccountNumber(number: accountNumber)
        cardInfo.upadtePaySystem(paySystem: paySystem)
    }
}
