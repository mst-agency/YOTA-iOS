//
//  MainScreenViewController.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

final class MainScreenViewController: UIViewController {

    // MARK: - Property list

    private let output: MainScreenViewOutput

    private let tableView = UITableView()

    // MARK: - Initialization

    init(output: MainScreenViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    // MARK: - Private methods

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none

        tableView.allowsSelection = false
        tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9333333333, blue: 0.9529411765, alpha: 1)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension MainScreenViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension MainScreenViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}

// MARK: IMainScreenViewController

extension MainScreenViewController: MainScreenInput {

    func reloadTable() {
        tableView.reloadData()
    }
}
