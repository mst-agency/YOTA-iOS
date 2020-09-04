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
    private let reelView = ReelView()

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
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [connectLabelAndNumberView, unlimitedAppsView, priceView, reelView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
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

            reelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            reelView.topAnchor.constraint(equalTo: unlimitedAppsView.bottomAnchor),
            reelView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            reelView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}

// MARK: - ConnectionCellInput

extension ConnectionCell: ConnectionCellInput {

    func setConnectionAndNumberViewText(connectionLabelText: String, numberLabelText: String) {
        connectLabelAndNumberView.setText(connectionLabelText, numberLabelText)
    }

    func setInlimitedAppsViewText(_ text: String, and imagesNamed: [String]) {
        unlimitedAppsView.setLabelText(text)
        unlimitedAppsView.setImages(imagesNamed.compactMap { UIImage(named: $0) })
    }

    func setPriceDescriptionLabelText(_ descriptionText: String, price: String) {
        priceView.setPriceDescriptionLabelText(descriptionText)
        priceView.setPriceLabelText(price)
    }
}
