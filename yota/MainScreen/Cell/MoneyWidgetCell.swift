//
//  MoneyWidgetCell.swift
//  yota
//
//  Created by Victor on 01.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class MoneyWidgetCell: UITableViewCell {
    
    // MARK: - Properties (Public)

    static let reuseID = String(describing: MoneyWidgetCell.self)

    // MARK: - Properties (Private)

    private let widgetView = MoneyWidgetView()

    // MARK: - Initializers (Public)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let conf = MoneyModuleConfigurator()
        conf.configureModuleForViewInput(viewInput: widgetView)

        backgroundColor = UIColor.MainScreen.tableViewBackground
        widgetView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(widgetView)
        NSLayoutConstraint.activate(
            [
                widgetView.topAnchor.constraint(equalTo: contentView.topAnchor),
                widgetView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: WidgetSize.widgetPadding(widgetReuseID: type(of: self).reuseID).left),
                widgetView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -WidgetSize.widgetPadding(widgetReuseID: type(of: self).reuseID).right),
                widgetView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }

    required init?(coder: NSCoder) {
        fatalError("MoneyWidgetCell has not been implemented")
    }
}
