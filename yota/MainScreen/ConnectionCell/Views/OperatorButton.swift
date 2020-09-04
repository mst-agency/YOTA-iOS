//
//  OperatorButton.swift
//  yota
//
//  Created by Anton on 03.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

enum OperatorButtonType {
    case plus
    case minus
}

final class OperatorButton: UIView {

    // MARK: - Property list

    private let type: OperatorButtonType
    private let imageView = UIImageView()
    private var action:( () -> Void )?
    private var timer: Timer?
    private var runCount: Float = 0

    // MARK: - Initialization

    init(type: OperatorButtonType) {
        self.type = type
        super.init(frame: .zero)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Internal methods

    func addAction(action: @escaping () -> Void) {
        self.action = action
    }

    func enable() {

        isUserInteractionEnabled = true
        switch type {
        case .minus: imageView.image = UIImage(named: "enableMinus.png")
        case .plus: imageView.image = UIImage(named: "enablePlus.png")
        }
    }

    func disable() {

        isUserInteractionEnabled = false
        switch type {
        case .minus: imageView.image = UIImage(named: "disableMinus.png")
        case .plus: imageView.image = UIImage(named: "disablePlus.png")
        }
    }

    // MARK: - Private methods

    private func setup() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        setupGesture()
    }

    @objc private func timerFire(timer: Timer) {
        self.runCount += 0.01

        if self.runCount >= 1 && self.runCount < 3 {
                print("version1 \(self.runCount)")
        } else if self.runCount >= 3 && self.runCount < 5 {
                print("version2 = \(self.runCount)")
        } else if self.runCount >= 5 {
            action?()
            print("self.runCount = \(self.runCount)")
        }
    }

    private func setupGesture() {
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(pressAction)))
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
    }

    @objc private func tapAction() {
        action?()
    }

    @objc private func pressAction(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerFire), userInfo: nil, repeats: true)
        } else {
            self.runCount = 0
            self.timer?.invalidate()
        }
    }
}
