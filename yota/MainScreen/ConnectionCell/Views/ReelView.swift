//
//  ReelView.swift
//  yota
//
//  Created by Anton on 02.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class ReelView: UIView {

    // MARK: - Property list

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ReelFlowLayout())
    private let minusButton = OperatorButton(type: .minus)
    private let plusButton = OperatorButton(type: .plus)

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods

    private func setup() {
        [collectionView, minusButton, plusButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        minusButton.enable()
        plusButton.enable()
        collectionView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        NSLayoutConstraint.activate([
            minusButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            minusButton.topAnchor.constraint(equalTo: topAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),

            collectionView.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            plusButton.topAnchor.constraint(equalTo: topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate

extension ReelView: UICollectionViewDelegate { }

// MARK: - UICollectionViewFlowLayoutDelegate

//extension ReelView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 60)
//    }
//}

// MARK: - UICollectionViewDataSource

extension ReelView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}
