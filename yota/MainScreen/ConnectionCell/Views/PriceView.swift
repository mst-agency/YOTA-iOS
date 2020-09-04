//
//  PriceView.swift
//  yota
//
//  Created by Anton on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class PriceView: UIView {

    // MARK: - Property list

    private let priceDescriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let separatorView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPriceDescriptionLabelText(_ text: String) {
        priceDescriptionLabel.text = text
    }

    func setPriceLabelText(_ text: String) {
        priceLabel.text = text
    }
    
    // MARK: - Private methods

    private func setupForIPhoneX() {
        priceDescriptionLabel.font = .circeRegular(size: 16)
        priceLabel.font = .circeBold(size: 26)
        NSLayoutConstraint.activate([
            priceDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            priceDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            priceDescriptionLabel.heightAnchor.constraint(equalToConstant: 24),
            priceDescriptionLabel.widthAnchor.constraint(equalToConstant: 24),

            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            priceLabel.heightAnchor.constraint(equalToConstant: 64),
            priceLabel.widthAnchor.constraint(equalToConstant: 38),
            priceLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10),

            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    private func setupForIPhone6Plus() {
        priceDescriptionLabel.font = .circeRegular(size: 16)
        priceLabel.font = .circeBold(size: 26)
        NSLayoutConstraint.activate([
            priceDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 26),
            priceDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceDescriptionLabel.heightAnchor.constraint(equalToConstant: 24),
            priceDescriptionLabel.widthAnchor.constraint(equalToConstant: 175),

            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceLabel.widthAnchor.constraint(equalToConstant: 64),
            priceLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -13),

            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    private func setupForIPhone6() {
        priceDescriptionLabel.font = .circeRegular(size: 15)
        priceLabel.font = .circeBold(size: 24)

        NSLayoutConstraint.activate([
            priceDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            priceDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceDescriptionLabel.heightAnchor.constraint(equalToConstant: 22),
            priceDescriptionLabel.widthAnchor.constraint(equalToConstant: 164),

            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceLabel.widthAnchor.constraint(equalToConstant: 59),
            priceLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -5),

            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupForIPhone5() {
        priceDescriptionLabel.font = .circeRegular(size: 15)
        priceLabel.font = .circeBold(size: 20)
        NSLayoutConstraint.activate([
            priceDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            priceDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            priceDescriptionLabel.heightAnchor.constraint(equalToConstant: 22),
            priceDescriptionLabel.widthAnchor.constraint(equalToConstant: 164),

            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            priceLabel.heightAnchor.constraint(equalToConstant: 29),
            priceLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -5),

            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    private func setupForIPad() {
        priceDescriptionLabel.font = .circeRegular(size: 20)
        priceLabel.font = .circeBold(size: 38)
        NSLayoutConstraint.activate([
            priceDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            priceDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            priceDescriptionLabel.heightAnchor.constraint(equalToConstant: 29),
            priceDescriptionLabel.widthAnchor.constraint(equalToConstant: 219),

            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            priceLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -3),

            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    private func setupColors() {
        priceDescriptionLabel.textColor = UIColor.Money.title
        priceLabel.textColor = UIColor.Money.title
        separatorView.backgroundColor = UIColor.Connection.separatorColor
    }

    private func setup() {
        [priceDescriptionLabel, priceLabel, separatorView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        switch UIDevice.screenType {
        case .iphoneX: setupForIPhoneX()
        case .iphone6plus: setupForIPhone6Plus()
        case .iphone6: setupForIPhone6()
        case .iphone5: setupForIPhone5()
        case .ipad: setupForIPad()
        }

        setupColors()
    }
}
