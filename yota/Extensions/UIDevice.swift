//
//  UIDevice.swift
//  yota
//
//  Created by Anton on 30.08.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import UIKit

extension UIDevice {

    static let screenType: ScreenType = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        // swiftlint:disable function_body_length
        func mapToDevice(identifier: String) -> ScreenType {
            switch identifier {
            case
            "iPod5,1",
            "iPhone3,1",
            "iPhone3,2",
            "iPhone3,3",
            "iPhone4,1",
            "iPhone5,1",
            "iPhone5,2",
            "iPhone5,3",
            "iPhone5,4",
            "iPhone6,1",
            "iPhone6,2",
            "iPhone8,4": return .iphone5
            case
            "iPhone7,2",
            "iPod7,1",
            "iPod9,1",
            "iPhone8,1",
            "iPhone9,1",
            "iPhone9,3",
            "iPhone10,1",
            "iPhone10,4",
            "iPhone12,8": return .iphone6
            case
            "iPhone7,1",
            "iPhone8,2",
            "iPhone9,2",
            "iPhone9,4",
            "iPhone10,2",
            "iPhone10,5": return .iphone6plus
            case
            "iPhone10,3",
            "iPhone10,6",
            "iPhone11,2",
            "iPhone11,4",
            "iPhone11,6",
            "iPhone11,8",
            "iPhone12,1",
            "iPhone12,3",
            "iPhone12,5": return .iphoneX
            case
            "iPad2,1",
            "iPad2,2",
            "iPad2,3",
            "iPad2,4",
            "iPad3,1",
            "iPad3,2",
            "iPad3,3",
            "iPad3,4",
            "iPad3,5",
            "iPad3,6",
            "iPad6,11",
            "iPad6,12",
            "iPad7,5",
            "iPad7,6",
            "iPad7,11",
            "iPad7,12",
            "iPad4,1",
            "iPad4,2",
            "iPad4,3",
            "iPad5,3",
            "iPad5,4",
            "iPad11,4",
            "iPad11,5",
            "iPad2,5",
            "iPad2,6",
            "iPad2,7",
            "iPad4,4",
            "iPad4,5",
            "iPad4,6",
            "iPad4,7",
            "iPad4,8",
            "iPad4,9",
            "iPad5,1",
            "iPad5,2",
            "iPad11,1",
            "iPad11,2",
            "iPad6,3",
            "iPad6,4",
            "iPad7,3",
            "iPad7,4",
            "iPad8,1",
            "iPad8,2",
            "iPad8,3",
            "iPad8,4",
            "iPad8,9",
            "iPad8,10",
            "iPad6,7",
            "iPad6,8",
            "iPad7,1",
            "iPad7,2",
            "iPad8,5",
            "iPad8,6",
            "iPad8,7",
            "iPad8,8",
            "iPad8,11",
            "iPad8,12": return .ipad
            case "i386", "x86_64": return mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS")

            default: return .iphoneX
            }
        }

        return mapToDevice(identifier: identifier)
    }()

}
