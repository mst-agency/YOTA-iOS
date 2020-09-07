//
//  MockGetProfileUseCase.swift
//  yota
//
//  Created by Anton on 06.09.2020.
//  Copyright © 2020 MST. All rights reserved.
//

import Foundation
import YotaModels

final class MockGetProfileUseCase {

    // MARK: - Property list

    weak var cellPresenter: ConnectionCellExternalInput?

    // MARK: - Private methods

    private func createPossibleMinutes() -> [PossibleValues] {
        let rangeWithFormula = RangeWithFormula(initialValue: 100, endValue: 300, formula: "x + (1*0.7)")
        let fixValuesWithPrices = [FixValueWithPrice(value: 300, price: 570),
                                   FixValueWithPrice(value: 600, price: 890),
                                   FixValueWithPrice(value: 900, price: 1020)]
        let possibleValuesFromFixValuesWithPrices = fixValuesWithPrices.map { PossibleValues(fixValueWithPrice: $0) }
        return [PossibleValues(rangeWithFormula: rangeWithFormula)] + possibleValuesFromFixValuesWithPrices
    }

    private func createPossibleGigabytes() -> [PossibleValues] {
        return [PossibleValues(fixValueWithPrice: FixValueWithPrice(infinity: true, price: 200))]
    }

    private func createProfile() -> Profile {
        let phoneNumber = PhoneNumber(numberString: "+7 999 549-20-91", numberChangeAllowed: true)
        let possibleMinutes = createPossibleMinutes()
        let possibleGigabytes = createPossibleGigabytes()
        var dateComponents = DateComponents()
        let optionProperties = OptionProperties(enabled: true, price: 50)
        let options = Options(sms: optionProperties,
                              vk: optionProperties,
                              fb: optionProperties,
                              insta: optionProperties,
                              youtube: optionProperties,
                              skype: optionProperties,
                              twitter: optionProperties,
                              ok: optionProperties,
                              whatsapp: optionProperties,
                              viber: optionProperties)
        dateComponents.setValue(1, for: .month)
        let calendar = Calendar.current
        let nextPaymentDate = calendar.date(byAdding: dateComponents, to: Date())?.timeIntervalSince1970 ?? Date().timeIntervalSince1970
        let availableMinutes = Accumulator(currentVolume: 100, fullVolume: 300)
        let availableGigabytes = Accumulator(isInfinity: true)
        let plannedMinutes = FixValueWithPrice(value: 100, price: 175)
        let plannedGigabytes = FixValueWithPrice(infinity: true, price: 200)
        let plannedTariff = PlannedTariff(options: options, minutes: plannedMinutes, gigabytes: plannedGigabytes)

        let profile = Profile(finblock: false,
                              phoneNumber: phoneNumber,
                              options: options,
                              pricePerMinute: 1.2,
                              nextPaymentDate: Int(nextPaymentDate),
                              availableMinutes: availableMinutes,
                              availableGigabytes: availableGigabytes,
                              possibleMinutes: possibleMinutes,
                              possibleGigabytes: possibleGigabytes,
                              plannedTariff: plannedTariff)
        return profile
    }
}

// MARK: GetProfileUseCase

extension MockGetProfileUseCase: GetProfileUseCase {

    func getProfile() {
           DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + 1.5, execute: {
               let profile = self.createProfile()
               DispatchQueue.main.async {
                   self.cellPresenter?.successLoading(profile)
               }
           })
       }
}
