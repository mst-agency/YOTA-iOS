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
    private var headerView: MoneyHeaderViewInput?
    
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
        output.didTriggerViewDidLoad()
        setupTableView()
        setupHeaderView()
    }

    // MARK: - Private methods

    private func setupTableView() {
        tableView.register(InAppCell.self, forCellReuseIdentifier: InAppCell.reuseID)
        tableView.register(MoneyWidgetCell.self, forCellReuseIdentifier: MoneyWidgetCell.reuseID)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        let moneyHeaderHeight = WidgetSize.moneyHeaderViewWidgetHeightRange().lowerBound
        tableView.contentInset = UIEdgeInsets(top: moneyHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.backgroundColor = UIColor.MainScreen.tableViewBackground

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupHeaderView() {
        self.headerView = MoneyHeaderWidgetView(frame: .zero)
        let conf = MoneyModuleConfigurator()
        conf.configureModuleForViewInput(viewInput: self.headerView)
        
        guard let headerView = self.headerView as? UIView else { return }
        view.addSubview(headerView)
        headerView.backgroundColor = .green
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
             headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
             headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)])
    }
}

// MARK: - UITableViewDataSource

extension MainScreenViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.didTriggerGetNumberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        output.didTriggerGetWidgetCell(index: indexPath.row, tableView: tableView)
    }
}

// MARK: - UITableViewDelegate

extension MainScreenViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        output.didTriggerGetWidgetSize(index: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let header = headerView as? MoneyHeaderWidgetView
        DispatchQueue.main.async {
            header?.didScroll(scrollView: scrollView)
        }
    }
}

// MARK: IMainScreenViewController

extension MainScreenViewController: MainScreenInput {}
