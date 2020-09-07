//
//  ConnectionCell.swift
//  yota
//
//  Created by Anton on 29.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class ConnectionCell: UITableViewCell {

    // MARK: - Property list

    static let reuseID = "ConnectionCell"

    var presenter: ConnectionCellOutput? {
        didSet { presenter?.configure() }
    }

    private let containerView = UIView()
    private let connectLabelAndNumberView = ConnectionLabelAndNumberView()
    private let unlimitedAppsView = UnlimitedAppsView()
    private let priceView = PriceView()
    private var horizontalInset: CGFloat {
        switch UIDevice.screenType {
        case .iphoneX: return 8
        case .iphone6plus, .iphone6, .iphone5: return 12
        case .ipad: return 114
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(containerView)
        backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [connectLabelAndNumberView, unlimitedAppsView, priceView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
        containerView.layer.cornerRadius = 12
        containerView.layer.shadowOffset = CGSize(width: containerView.bounds.width, height: containerView.bounds.height + 6)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalInset),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            connectLabelAndNumberView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            connectLabelAndNumberView.topAnchor.constraint(equalTo: containerView.topAnchor),
            connectLabelAndNumberView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            priceView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            priceView.topAnchor.constraint(equalTo: connectLabelAndNumberView.bottomAnchor),
            priceView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            unlimitedAppsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            unlimitedAppsView.topAnchor.constraint(equalTo: priceView.bottomAnchor),
            unlimitedAppsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            unlimitedAppsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}

// MARK: - ConnectionCellInput

extension ConnectionCell: ConnectionCellInput {

    func setConnectionAndNumberViewText(connectionLabelText: String, numberLabelText: String) {
        connectLabelAndNumberView.setText(connectionLabelText, numberLabelText)
    }

    func setUnlimitedAppsViewText(_ text: String, and imagesNamed: [String]) {
        unlimitedAppsView.setLabelText(text)
        unlimitedAppsView.setImages(imagesNamed.compactMap { UIImage(named: $0) })
    }

    func setPriceDescriptionLabelText(_ descriptionText: String, price: String) {
        priceView.setPriceDescriptionLabelText(descriptionText)
        priceView.setPriceLabelText(price)
    }

    func showError(_ error: ServiceError) { }
}
