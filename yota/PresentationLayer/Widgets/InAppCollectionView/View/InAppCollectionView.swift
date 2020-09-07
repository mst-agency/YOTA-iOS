//
//  InAppCollectionView.swift
//  yota
//
//  Created by Victor on 03.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class InAppCollectionView: UICollectionView {
    
    // MARK: - Properties (Public)
    var output: InAppCollectionViewOutput?
    
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
            guard let output = self.output else { return }
            self.scrollToItem(at: IndexPath(row: output.didTriggeredNumberOfItemsInSection() / 2, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
}

// MARK: - InAppCollectionViewInput

extension InAppCollectionView: InAppCollectionViewInput {
    func showData() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension InAppCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension InAppCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output?.didTriggeredNumberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InAppCollectionViewCell.reuseID, for: indexPath) as? InAppCollectionViewCell else { fatalError("Wrong cell") }
        if let output = self.output {
            cell.configure(notificationInfo: (output.didTriggeredCellConfigure(index: indexPath.row)))
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension  InAppCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        WidgetSize.widgetSize(widgetReuseID: InAppCell.reuseID)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: WidgetSize.widgetPadding(widgetReuseID: InAppCell.reuseID).left * 2, bottom: 0, right: WidgetSize.widgetPadding(widgetReuseID: InAppCell.reuseID).right * 2)
    }
}
