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

    private let presenter: MainScreenViewOutput

    private let tableView = UITableView()
    private var headerView: MoneyHeaderViewInput?
    
    // MARK: - Initialization

    init(output: MainScreenViewOutput) {
        self.presenter = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

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
        tableView.register(ConnectionCell.self, forCellReuseIdentifier: ConnectionCell.reuseID)
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
        presenter.getNumberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.getCellPresenter(at: indexPath) {
        case let cellPresenter as ConnectionCellPresenter:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConnectionCell.reuseID) as? ConnectionCell else { fallthrough }

            cellPresenter.cell = cell
            cell.presenter = cellPresenter
            return cell
        default: return UITableViewCell()

        let widgetReuseID = presenter.didTriggerGetWidgetCellReuseID(index: indexPath.row)
        
        switch widgetReuseID {
        case MoneyWidgetCell.reuseID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoneyWidgetCell.reuseID) as? MoneyWidgetCell else { fallthrough }
            return cell
        case InAppCell.reuseID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InAppCell.reuseID) as? InAppCell else { fallthrough }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension MainScreenViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        presenter.didTriggerGetWidgetSize(index: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let header = headerView as? MoneyHeaderWidgetView
        DispatchQueue.main.async {
            header?.didScroll(scrollView: scrollView)
        }
    }

    func recalculateCellSize() {
        tableView.performBatchUpdates(nil)
    }
}

// MARK: IMainScreenViewController

extension MainScreenViewController: MainScreenInput {}
