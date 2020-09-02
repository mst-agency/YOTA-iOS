//
//  InAppWidgetView.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class InAppWidgetView: UIView {
    
    // MARK: - Properties (Public)
    
    var output: InAppWidgetViewOutput?
    
    // MARK: - Properties (Private)
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeExtraBold(size: 14.0)
        label.numberOfLines = 0
        label.text = "Недостаточно средств для продления пакета. Доступ в интернет заблокирован. Пополните счет на ХХХ ₽"
        label.textAlignment = .center
        label.textColor = UIColor.InApp.title
        return label
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.InAppButton.background
        button.setTitleColor(UIColor.InAppButton.title, for: .normal)
        button.titleLabel?.font = UIFont.circeExtraBold(size: 14)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Пополнить счет на xxxx р", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var closebutton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "inAppClose"), for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        return button
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
    
    private func setup() {
        
        backgroundColor = UIColor.InApp.background
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(actionButton)
        NSLayoutConstraint.activate(
            [
                actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
                actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -76),
                actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                actionButton.heightAnchor.constraint(equalToConstant: 28.0)
            ])
        
        addSubview(mainTitle)
        NSLayoutConstraint.activate(
            [
                mainTitle.topAnchor.constraint(equalTo: topAnchor, constant: 7),
                mainTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38),
                mainTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -39),
                mainTitle.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -9)
            ])
        
        addSubview(closebutton)
        NSLayoutConstraint.activate(
            [
                closebutton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                closebutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                closebutton.heightAnchor.constraint(equalToConstant: 12),
                closebutton.widthAnchor.constraint(equalToConstant: 12)
            ])
    }
}

// MARK: - MoneyWidgetViewInput

extension InAppWidgetView: InAppWidgetViewInput {}
