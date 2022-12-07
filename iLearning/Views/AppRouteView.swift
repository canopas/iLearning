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
    
    @StateObject var pilot: UIPilot<AppRoute> = .init(initial: .Onboard)

    var body: some View {
        UIPilotHost(pilot) { route in
            switch route {
            case .Onboard:
                OnboardView(viewModel: OnboardViewModel(pilot: pilot))
                    .navigationBarIsHidden(true)
            case .Login:
                LoginView()
            case .Home:
                HomeView()
            }
        }
        .onAppear {
            if AppPreference.shared.isOnboardShown {
                pilot.pop()
                pilot.push(.Login)
            }
        }
    }
}
