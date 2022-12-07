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
    
    private let appPilot: UIPilot<AppRoute>
    
    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }
    
    func onStartButtonTap() {
        appPilot.pop()
        AppPreference.shared.isOnboardShown = true
        appPilot.push(.Login)
    }
}
