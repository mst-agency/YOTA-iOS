//
//  InAppCollectionViewCell.swift
//  yota
//
//  Created by Victor on 03.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class InAppCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: InAppCollectionViewCell.self)
    
    // MARK: - Properties (Private)
    
    private let widgetView = InAppWidgetView(frame: .zero)

    // MARK: - Initializers (Public)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let conf = MoneyModuleConfigurator()
        conf.configureModuleForViewInput(viewInput: widgetView)
        backgroundColor = UIColor.MainScreen.tableViewBackground
        widgetView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(widgetView)
        NSLayoutConstraint.activate(
            [
                widgetView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: WidgetSize.widgetPadding(widgetReuseID: InAppCell.reuseID).top),
                widgetView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                widgetView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
                widgetView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -WidgetSize.widgetPadding(widgetReuseID: InAppCell.reuseID).bottom)
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("InAppCollectionCell has not been implemented")
    }
}
