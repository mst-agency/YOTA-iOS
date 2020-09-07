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
    
    private var action: (() -> Void )?

    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.circeExtraBold(size: 14.0)
        label.numberOfLines = 0
        label.text = ""
        label.textAlignment = .center
        label.textColor = UIColor.InApp.title
        label.accessibilityIdentifier = AccessibilityIdentifiers.InApp.inAppTitle
        return label
    }()

    private lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.InAppButton.background
        button.setTitleColor(UIColor.InAppButton.title, for: .normal)
        button.titleLabel?.font = UIFont.circeExtraBold(size: 14)
        button.titleLabel?.textAlignment = .center
        button.setTitle("", for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionButtonTap), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifiers.InApp.inAppActionButton
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "inAppClose"), for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifiers.InApp.inAppCloseButton
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
        
        addSubview(closeButton)
        NSLayoutConstraint.activate(
            [
                closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                closeButton.heightAnchor.constraint(equalToConstant: 12),
                closeButton.widthAnchor.constraint(equalToConstant: 12)
            ])
    }
    
    @objc private func actionButtonTap() {
        self.action?()
    }
    
    @objc private func closeButtonTap() {
        output?.tapClose()
    }
}

// MARK: - MoneyWidgetViewInput

extension InAppWidgetView: InAppWidgetViewInput {
    func dropContent() {
        self.mainTitle.text = ""
        self.actionButton.setTitle("", for: .normal)
        self.actionButton.isHidden = true
        self.action = nil
    }
    func setButtonAction(action: @escaping (() -> Void)) {
        self.action = action
    }
    
    func displayButtonTitle(title: String) {
        self.actionButton.isHidden = false
        self.actionButton.setTitle(title, for: .normal)
    }
    
    func displayInAppContent(text: String) {
        self.mainTitle.text = text
    }
}
