//
//  AppRouteView.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI
import UIPilot
import FirebaseAuth

public enum AppRoute: Equatable {
    case Onboard
    case Login
    case Home
    case EmailLogin(isForSignUp: Bool)
    case Profile
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
                    .environmentObject(pilot)
            case .EmailLogin(let isForSignUp):
                EmailLoginView(viewModel: EmailLoginViewModel(pilot: pilot, isForSignUp: isForSignUp))
            case .Profile:
                ProfileView(viewModel: ProfileViewModel(pilot: pilot))
            }
        }
        .onAppear {
            if preference.isOnboardShown {
                pilot.pop()
                if preference.isVerifiedUser {
                    func isUserLoggedIn() -> Bool {
                        return Auth.auth().currentUser != nil
                    }
                    pilot.push(.Home)
                } else {
                    pilot.push(.Login)
                }
            }
        }
    }
}
