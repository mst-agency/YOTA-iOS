//
//  ConnectionCellPresentationModel.swift
//  yota
//
//  Created by Anton on 07.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import YotaModels

struct ConnectionCellPresentationModel {

    // MARK: - Property list

    let unlimitedAppsText = "Безлимитные мобильные приложения"
    let priceDescriptionText = "Стоимость за 30 дней"
    let connectionText = "СВЯЗЬ"

    let imageNamesArray: [String]
    let fullCostOfThePlannedTariff: String
    let phoneNumber: String

    init(from profile: Profile) {
        var imageNamesArray = [String]()
        var fullCostOfThePlannedTariff = 0

        let options = profile.options
        if options.sms.enabled {
            imageNamesArray.append("sms.png")
            fullCostOfThePlannedTariff += options.sms.price
        }
        if options.vk.enabled {
            imageNamesArray.append("vk.png")
            fullCostOfThePlannedTariff += options.vk.price
        }
        if options.fb.enabled {
            imageNamesArray.append("fb.png")
            fullCostOfThePlannedTariff += options.fb.price
        }
        if options.insta.enabled {
            imageNamesArray.append("insta.png")
            fullCostOfThePlannedTariff += options.insta.price
        }
        if options.youtube.enabled {
            imageNamesArray.append("youtube.png")
            fullCostOfThePlannedTariff += options.youtube.price
        }
        if options.skype.enabled {
            imageNamesArray.append("skype.png")
            fullCostOfThePlannedTariff += options.skype.price
        }
        if options.twitter.enabled {
            imageNamesArray.append("twitter.png")
            fullCostOfThePlannedTariff += options.twitter.price
        }
        if options.ok.enabled {
            imageNamesArray.append("ok.png")
            fullCostOfThePlannedTariff += options.ok.price
        }
        if options.whatsapp.enabled {
            imageNamesArray.append("whatsapp.png")
            fullCostOfThePlannedTariff += options.whatsapp.price
        }
        if options.viber.enabled {
            imageNamesArray.append("viber.png")
            fullCostOfThePlannedTariff += options.viber.price
        }

        let plannedTariff = profile.plannedTariff

        fullCostOfThePlannedTariff += plannedTariff.minutes.price + plannedTariff.gigabytes.price

        self.phoneNumber = profile.phoneNumber.numberString
        self.imageNamesArray = imageNamesArray
        self.fullCostOfThePlannedTariff = fullCostOfThePlannedTariff.description + "₽"
    }
}
