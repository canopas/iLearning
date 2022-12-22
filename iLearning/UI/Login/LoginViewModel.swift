//
//  LoginViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 09/12/22.
//

import Combine
import UIPilot

class LoginViewModel: ObservableObject {

    @Inject var preference: AppPreferences

    private let appPilot: UIPilot<AppRoute>

    var emailId: String = ""
    var firstName: String = ""
    var lastName: String = ""

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func setUser(emailId: String, firstName: String, lastName: String) {
        preference.userEmailId = emailId
        preference.userFirstName = firstName
        preference.userLastName = lastName
        preference.loginType = .Apple
        preference.isVerifiedUser = true
        goToHome()
    }

    func goToHome() {
        appPilot.pop()
        appPilot.push(.Home)
    }

    func clickOnEmailLogin() {
        appPilot.push(.EmailLogin(isForSignUp: false))
    }

    func clickOnCreateAccount() {
        appPilot.push(.EmailLogin(isForSignUp: true))
    }
}
