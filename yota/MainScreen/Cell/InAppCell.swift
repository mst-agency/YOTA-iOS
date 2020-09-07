//
//  InAppCell.swift
//  yota
//
//  Created by Victor on 03.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class InAppCell: UITableViewCell {

    static let reuseID = String(describing: InAppCell.self)
    
    // MARK: - Properties (Private)
    
    private let collectionView = InAppCollectionView()
    
    // MARK: - Initializers (Public)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let conf = InAppCollectionConfigurator()
        conf.configureModule(viewInput: collectionView)
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
    }

    required init?(coder: NSCoder) {
        fatalError("InAppCell has not been implemented")
    }
}
