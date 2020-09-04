//
//  AccumulatorView.swift
//  yota
//
//  Created by Anton on 01.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class AccumulatorView: UIView {

    // MARK: - Property list

    private let titleLabel = UILabel()
    private let currentVolumeLabel = UILabel()
    private let fullVolumeLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        switch UIDevice.screenType {
        default: break
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupForIPhoneX() {
        
    }
}
