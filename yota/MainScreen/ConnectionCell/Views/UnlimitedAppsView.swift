//
//  UnlimitedAppsView.swift
//  yota
//
//  Created by Anton on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class UnlimitedAppsView: UIView {

    // MARK: - Property list

    private let unlimitedAppsLabel = UILabel()
    private let unlimitedAppsImages = UIStackView()

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

    func setLabelText(_ text: String) {
        unlimitedAppsLabel.text = text
    }

    func setImages(_ images: [UIImage]) {
        unlimitedAppsImages.arrangedSubviews.forEach { $0.removeFromSuperview() }

        images.forEach {
            let imageView = UIImageView(image: $0)
            imageView.contentMode = .scaleAspectFit
            unlimitedAppsImages.addArrangedSubview(imageView)
        }
    }

    // MARK: - Private methods

    private func setupForIPhoneX() {
        unlimitedAppsLabel.font = .circeRegular(size: 16)
        unlimitedAppsImages.spacing = 12

        NSLayoutConstraint.activate([
            unlimitedAppsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            unlimitedAppsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            unlimitedAppsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -72),
            unlimitedAppsLabel.heightAnchor.constraint(equalToConstant: 24),

            unlimitedAppsImages.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            unlimitedAppsImages.topAnchor.constraint(equalTo: unlimitedAppsLabel.topAnchor, constant: 5),
            unlimitedAppsImages.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -73),
            unlimitedAppsImages.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupForIPhone6Plus() {
        unlimitedAppsLabel.font = .circeRegular(size: 16)
        unlimitedAppsImages.spacing = 12

        NSLayoutConstraint.activate([
            unlimitedAppsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            unlimitedAppsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12.5),
            unlimitedAppsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -101),
            unlimitedAppsLabel.heightAnchor.constraint(equalToConstant: 24),

            unlimitedAppsImages.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            unlimitedAppsImages.topAnchor.constraint(equalTo: unlimitedAppsLabel.bottomAnchor, constant: 5),
            unlimitedAppsImages.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -102),
            unlimitedAppsImages.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupForIPhone6() {
        unlimitedAppsLabel.font = .circeRegular(size: 15)
        unlimitedAppsImages.spacing = 7

        NSLayoutConstraint.activate([
            unlimitedAppsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            unlimitedAppsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7.5),
            unlimitedAppsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -79),
            unlimitedAppsLabel.heightAnchor.constraint(equalToConstant: 22),

            unlimitedAppsImages.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            unlimitedAppsImages.topAnchor.constraint(equalTo: unlimitedAppsLabel.bottomAnchor, constant: 7),
            unlimitedAppsImages.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -121),
            unlimitedAppsImages.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupForIPhone5() {
        unlimitedAppsLabel.font = .circeRegular(size: 15)
        unlimitedAppsImages.spacing = 7

        NSLayoutConstraint.activate([
            unlimitedAppsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            unlimitedAppsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7.5),
            unlimitedAppsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            unlimitedAppsLabel.heightAnchor.constraint(equalToConstant: 22),

            unlimitedAppsImages.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            unlimitedAppsImages.topAnchor.constraint(equalTo: unlimitedAppsLabel.bottomAnchor, constant: 7),
            unlimitedAppsImages.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -68),
            unlimitedAppsImages.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupForIPad() {
        unlimitedAppsLabel.font = .circeRegular(size: 20)
        unlimitedAppsImages.spacing = 12

        NSLayoutConstraint.activate([
            unlimitedAppsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            unlimitedAppsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.5),
            unlimitedAppsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 175),
            unlimitedAppsLabel.heightAnchor.constraint(equalToConstant: 29),

            unlimitedAppsImages.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            unlimitedAppsImages.topAnchor.constraint(equalTo: unlimitedAppsLabel.bottomAnchor, constant: 4),
            unlimitedAppsImages.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -207),
            unlimitedAppsImages.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupColors() {
        unlimitedAppsLabel.textColor = UIColor.Money.title
    }

    private func addAccessibilityIdenfiers() {
        unlimitedAppsLabel.accessibilityIdentifier = AccessibilityIdentifiers.ConnectionModule.unlimitedAppsLabel
        unlimitedAppsImages.accessibilityIdentifier = AccessibilityIdentifiers.ConnectionModule.unlimitedAppsImages
    }

    private func setup() {
        [unlimitedAppsLabel, unlimitedAppsImages].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        unlimitedAppsImages.distribution = .fillEqually

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
