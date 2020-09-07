//
//  ConnectLabelAndNumberView.swift
//  yota
//
//  Created by Anton on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class ConnectionLabelAndNumberView: UIView {

    // MARK: - Property list

    private let connectionLabel = GradientLabel()
    private let numberView = UIView()
    private let numberLabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods

    func setText(_ connectionLabelText: String, _ numberLabelText: String) {
        connectionLabel.text = connectionLabelText
        numberLabel.text = numberLabelText
    }

    // MARK: - Private methods

    private func setupForIPhoneX() {
        connectionLabel.font = .circeBold(size: 16)
        numberLabel.font = .circeBold(size: 16)
        numberView.layer.cornerRadius = 13.5

        NSLayoutConstraint.activate([
            connectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            connectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            connectionLabel.heightAnchor.constraint(equalToConstant: 24),
            connectionLabel.widthAnchor.constraint(equalToConstant: 50),

            numberView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            numberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            numberView.widthAnchor.constraint(equalToConstant: 146),
            numberView.bottomAnchor.constraint(equalTo: bottomAnchor),

            numberLabel.topAnchor.constraint(equalTo: numberView.topAnchor, constant: 4),
            numberLabel.trailingAnchor.constraint(equalTo: numberView.trailingAnchor, constant: -10),
            numberLabel.leadingAnchor.constraint(equalTo: numberView.leadingAnchor, constant: 10),
            numberLabel.bottomAnchor.constraint(equalTo: numberView.bottomAnchor)
        ])
    }

    private func setupForIPhone6Plus() {
        connectionLabel.font = .circeBold(size: 16)
        numberLabel.font = .circeBold(size: 16)
        numberView.layer.cornerRadius = 13.5

        NSLayoutConstraint.activate([
            connectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            connectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            connectionLabel.heightAnchor.constraint(equalToConstant: 24),
            connectionLabel.widthAnchor.constraint(equalToConstant: 50),

            numberView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            numberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            numberView.widthAnchor.constraint(equalToConstant: 142),
            numberView.bottomAnchor.constraint(equalTo: bottomAnchor),

            numberLabel.leadingAnchor.constraint(equalTo: numberView.leadingAnchor, constant: 8),
            numberLabel.topAnchor.constraint(equalTo: numberView.topAnchor, constant: 6),
            numberLabel.trailingAnchor.constraint(equalTo: numberView.trailingAnchor, constant: -8),
            numberLabel.bottomAnchor.constraint(equalTo: numberView.bottomAnchor, constant: -6)
        ])
    }

    private func setupForIPhone6() {
        connectionLabel.font = .circeBold(size: 15)
        numberLabel.font = .circeBold(size: 16)
        numberView.layer.cornerRadius = 13.5

        NSLayoutConstraint.activate([
            connectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            connectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            connectionLabel.heightAnchor.constraint(equalToConstant: 22),
            connectionLabel.widthAnchor.constraint(equalToConstant: 47),

            numberView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            numberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            numberView.widthAnchor.constraint(equalToConstant: 144),
            numberView.bottomAnchor.constraint(equalTo: bottomAnchor),

            numberLabel.leadingAnchor.constraint(equalTo: numberView.leadingAnchor, constant: 8),
            numberLabel.topAnchor.constraint(equalTo: numberView.topAnchor, constant: 6),
            numberLabel.trailingAnchor.constraint(equalTo: numberView.trailingAnchor, constant: -8),
            numberLabel.bottomAnchor.constraint(equalTo: numberView.bottomAnchor, constant: -6)
        ])
    }

    private func setupForIPhone5() {
        connectionLabel.font = .circeBold(size: 15)
        numberLabel.font = .circeBold(size: 16)
        numberView.layer.cornerRadius = 13.5

        NSLayoutConstraint.activate([
            connectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            connectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            connectionLabel.heightAnchor.constraint(equalToConstant: 22),
            connectionLabel.widthAnchor.constraint(equalToConstant: 47),

            numberView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            numberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            numberView.widthAnchor.constraint(equalToConstant: 142),
            numberView.bottomAnchor.constraint(equalTo: bottomAnchor),

            numberLabel.leadingAnchor.constraint(equalTo: numberView.leadingAnchor, constant: 8),
            numberLabel.topAnchor.constraint(equalTo: numberView.topAnchor, constant: 6),
            numberLabel.trailingAnchor.constraint(equalTo: numberView.trailingAnchor, constant: -8),
            numberLabel.bottomAnchor.constraint(equalTo: numberView.bottomAnchor, constant: -6)
        ])
    }

    private func setupForIPad() {
        connectionLabel.font = .circeBold(size: 24)
        numberLabel.font = .circeBold(size: 18)
        numberView.layer.cornerRadius = 19

        NSLayoutConstraint.activate([
            connectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            connectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            connectionLabel.heightAnchor.constraint(equalToConstant: 35),
            connectionLabel.widthAnchor.constraint(equalToConstant: 75),

            numberView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            numberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            numberView.widthAnchor.constraint(equalToConstant: 162),
            numberView.bottomAnchor.constraint(equalTo: bottomAnchor),

            numberLabel.leadingAnchor.constraint(equalTo: numberView.leadingAnchor, constant: 10),
            numberLabel.topAnchor.constraint(equalTo: numberView.topAnchor, constant: 10),
            numberLabel.trailingAnchor.constraint(equalTo: numberView.trailingAnchor, constant: -10),
            numberLabel.bottomAnchor.constraint(equalTo: numberView.bottomAnchor, constant: -10)
        ])
    }

    private func setupColors() {
        numberView.backgroundColor = UIColor.CardIfno.background
        numberLabel.textColor = UIColor.Money.title
        let gradientColors = [UIColor.Gradient.firstColor, UIColor.Gradient.secondColor]
        connectionLabel.setGradient(colors: gradientColors)
    }

    private func addAccessibilityIdenfiers() {
        connectionLabel.accessibilityIdentifier = AccessibilityIdentifiers.ConnectionModule.connectionLabel
        numberView.accessibilityIdentifier = AccessibilityIdentifiers.ConnectionModule.connectionLabel
        numberLabel.accessibilityIdentifier = AccessibilityIdentifiers.ConnectionModule.numberLabel
    }

    private func setup() {

        addAccessibilityIdenfiers()

        [connectionLabel, numberView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        numberView.addSubview(numberLabel)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false

        switch UIDevice.screenType {
        case .iphoneX: setupForIPhoneX()
        case .iphone6plus: setupForIPhone6Plus()
        case .iphone6: setupForIPhone6()
        case .iphone5: setupForIPhone5()
        case .ipad: setupForIPad()
        }

        setupColors()
        addAccessibilityIdenfiers()
    }
}
