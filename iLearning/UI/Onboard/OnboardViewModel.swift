//
//  OnboardViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import Foundation
import Combine
import UIPilot

class OnboardViewModel: ObservableObject {

    @Inject var preference: AppPreferences

    private let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onStartButtonTap() {
        appPilot.pop()
        preference.isOnboardShown = true
        appPilot.push(.Login)
    }
}
