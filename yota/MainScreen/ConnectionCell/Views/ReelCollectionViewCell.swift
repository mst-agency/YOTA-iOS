//
//  ReelCollectionViewCell.swift
//  yota
//
//  Created by Anton on 03.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class ReelCollectionViewCell: UICollectionViewCell {

    // MARK: - Property list

    static let reuseID = "ReelCollectionViewCell"
    private let gradientLabel = GradientLabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .gray
        setupLabel()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods

    func setText(_ text: String) {
        gradientLabel.text = text
    }

    private func setupLabel() {
        contentView.addSubview(gradientLabel)
        gradientLabel.translatesAutoresizingMaskIntoConstraints = false
        gradientLabel.font = UIFont.circeExtraBold(size: 32)
        gradientLabel.textAlignment = .center
        gradientLabel.setGradient(colors: [UIColor.Gradient.firstColor, UIColor.Gradient.secondColor])

        NSLayoutConstraint.activate([
            gradientLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientLabel.topAnchor.constraint(equalTo: topAnchor),
            gradientLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
