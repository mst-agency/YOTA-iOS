//
//  AppDelegate.swift
//  yota
//
//  Created by Dexter on 24.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

@UIApplicationMain

final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        appCoordinator = AppCoordinator(with: window)
        appCoordinator?.start()

        return true
    }
}
