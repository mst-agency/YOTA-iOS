//
//  CircleView.swift
//  yota
//
//  Created by Anton on 02.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class CircleView: UIView {

    // MARK: - Property list

    private let currentVolumeLabel = UILabel()
    private let fullVolumeLabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
