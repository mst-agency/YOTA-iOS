//
//  AppCoordinator.swift
//  yota
//
//  Created by Anton on 27.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator {

    // MARK: - Property list

    private let window: UIWindow

    init(with window: UIWindow?) {
        self.window = window ?? UIWindow(frame: UIScreen.main.bounds)
    }
}

// MARK: - Coordinator

extension AppCoordinator: Coordinator {

    func start() {
        let (view, _) = MainScreenConfigurator().configure()
        let navigationViewController = UINavigationController(rootViewController: view)
        navigationViewController.isNavigationBarHidden = true
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}
