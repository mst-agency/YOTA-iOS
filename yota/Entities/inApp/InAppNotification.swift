//
//  InAppNotification.swift
//  yota
//
//  Created by Victor on 31.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation

struct InAppNotification {
    let displayCondition: DisplayCondition
    let text: String
    let hideCondition: HideCondition
    let button: InAppNotificationButton?
}

struct InAppNotificationButton {
    let title: String
    let routeType: InAppNotificationRoute?
}

enum InAppNotificationRoute {
    case inApplication
    case url
    case otherApp
}
