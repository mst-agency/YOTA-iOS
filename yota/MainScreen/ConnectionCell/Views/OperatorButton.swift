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
    private var mainTimer: Timer?
    private var firstSpeedTimer: Timer?
    private var secondSpeedTimer: Timer?
    private var thirdSpeedTimer: Timer?
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
        enable()
    }

    private func setupMainTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.runCount += 1

            if self.runCount >= 5 {
                self.setupThirdSpeedTimer()
            } else if self.runCount >= 3 {
                self.setupSecondSpeedTimer()
            } else if self.runCount >= 1 {
                self.setupFirstSpeedTimer()
            }
        })

        RunLoop.current.add(timer, forMode: .common)
        mainTimer = timer
    }

    private func setupFirstSpeedTimer() {
        guard firstSpeedTimer?.isValid == false || firstSpeedTimer == nil else { return }

        let timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { _ in
            self.action?()
        })

        RunLoop.current.add(timer, forMode: .common)
        firstSpeedTimer = timer
    }

    private func setupSecondSpeedTimer() {
        guard secondSpeedTimer?.isValid == false || secondSpeedTimer == nil else { return }
        firstSpeedTimer?.invalidate()

        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            self.action?()
        })

        RunLoop.current.add(timer, forMode: .common)
        secondSpeedTimer = timer
    }

    private func setupThirdSpeedTimer() {
        guard thirdSpeedTimer?.isValid == false || thirdSpeedTimer == nil else { return }
        secondSpeedTimer?.invalidate()

        let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            self.action?()
        })

        timer.fire()

        RunLoop.current.add(timer, forMode: .common)
        thirdSpeedTimer = timer
    }

    private func invalidateAllTimers() {
        [mainTimer, firstSpeedTimer, secondSpeedTimer, thirdSpeedTimer].forEach { $0?.invalidate() }
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
            setupMainTimer()
        } else {
            invalidateAllTimers()
            runCount = 0
        }
    }
}
