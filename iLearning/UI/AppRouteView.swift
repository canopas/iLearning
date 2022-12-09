//
//  AppRouteView.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI
import UIPilot

public enum AppRoute: Equatable {
    case Onboard
    case Login
    case Home
}

struct AppRouteView: View {

    @Inject var preference: AppPreference

    @StateObject var pilot: UIPilot<AppRoute> = .init(initial: .Onboard)

    var body: some View {
        UIPilotHost(pilot) { route in
            switch route {
            case .Onboard:
                OnboardView(viewModel: OnboardViewModel(pilot: pilot))
                    .navigationBarIsHidden(true)
            case .Login:
                LoginView(viewModel: LoginViewModel(pilot: pilot))
            case .Home:
                HomeView()
            }
        }
        .onAppear {
            if preference.isOnboardShown {
                pilot.pop()
                if preference.isVerifiedUser {
                    pilot.push(.Home)
                } else {
                    pilot.push(.Login)
                }
            }
        }
    }
}
