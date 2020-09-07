//
//  PaySystem.swift
//  yota
//
//  Created by Victor on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

protocol PaySystemViewable {
    func updatePaySystem(paySystem: PaySystem)
}

final class PaySystemView: UIView {

    // MARK: - Properties (Private)

    private lazy var paySystem: UIImageView = {
        let imageView = UIImageView(frame: CGRect())
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = AccessibilityIdentifiers.MoneyHeaderModule.paySystemImageView
        return imageView
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
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(paySystem)
        NSLayoutConstraint.activate(
            [paySystem.leadingAnchor.constraint(equalTo: leadingAnchor),
             paySystem.trailingAnchor.constraint(equalTo: trailingAnchor),
             paySystem.topAnchor.constraint(equalTo: topAnchor),
             paySystem.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}

// MARK: - PaySystemViewable

extension PaySystemView: PaySystemViewable {
    func updatePaySystem(paySystem: PaySystem) {
        switch paySystem {
        case .mastercard:
            self.paySystem.image = #imageLiteral(resourceName: "mastercard")
        }
    }
}
