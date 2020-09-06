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

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let minusButton = OperatorButton(type: .minus)
    private let plusButton = OperatorButton(type: .plus)
    private var centerCell: ReelCollectionViewCell?

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
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ReelCollectionViewCell.self, forCellWithReuseIdentifier: ReelCollectionViewCell.reuseID)

        NSLayoutConstraint.activate([
            minusButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            minusButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            collectionView.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 60),
            collectionView.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.centerYAnchor.constraint(equalTo: centerYAnchor)
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
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelCollectionViewCell.reuseID, for: indexPath) as? ReelCollectionViewCell {
            cell.setText(indexPath.item.description)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

// MARK: - UIScrollViewDelegate

extension ReelView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        // center X of collection View
//        let centerX = self.collectionView.center.x
//        
//        // only perform the scaling on cells that are visible on screen
//        for cell in self.collectionView.visibleCells {
//            
//            // coordinate of the cell in the viewcontroller's root view coordinate space
//            let basePosition = cell.convert(CGPoint.zero, to: self)
//            let cellCenterX = basePosition.x
//            let distance = abs(cellCenterX - centerX)
//            print("cellIndexPath = \(collectionView.indexPathForItem(at: cell.center))")
//            print("distance = \(distance)")
//        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        var indexOfCellWithLargestWidth = 0
//        var largestWidth: CGFloat = 1
//
//        for cell in collectionView.visibleCells where cell.frame.size.width > largestWidth {
//            largestWidth = cell.frame.size.width
//            if let indexPath = collectionView.indexPath(for: cell) {
//                indexOfCellWithLargestWidth = indexPath.item
//            }
//        }
//        collectionView.scrollToItem(at: IndexPath(item: indexOfCellWithLargestWidth, section: 0), at: .centeredHorizontally, animated: true)
    }
}
