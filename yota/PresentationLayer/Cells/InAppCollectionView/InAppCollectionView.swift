//
//  InAppCollectionView.swift
//  yota
//
//  Created by Victor on 03.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class InAppCollectionView: UICollectionView {
    // MARK: - Properties (Private)
    
    private let infiniteSize = 10000
    
    // MARK: - Initializers (Public)
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(InAppCollectionViewCell.self, forCellWithReuseIdentifier: InAppCollectionViewCell.reuseID)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = (WidgetSize.widgetPadding(widgetReuseID: InAppCell.reuseID).left + WidgetSize.widgetPadding(widgetReuseID: InAppCell.reuseID).right) / 2
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        backgroundColor = UIColor.MainScreen.tableViewBackground
        scrollToCenter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods (Private)
    
    private func scrollToCenter() {
        DispatchQueue.main.async {
            self.scrollToItem(at: IndexPath(row: self.infiniteSize/2, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension InAppCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension InAppCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.infiniteSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InAppCollectionViewCell.reuseID, for: indexPath) as? InAppCollectionViewCell else { fatalError("Wrong cell") }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension  InAppCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        WidgetSize.widgetSize(widgetReuseID: InAppCell.reuseID)
    }
}
