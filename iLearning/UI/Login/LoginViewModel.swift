//
//  LoginViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 09/12/22.
//

import Combine
import UIPilot

class LoginViewModel: ObservableObject {

    @Inject var preference: AppPreference

    private let appPilot: UIPilot<AppRoute>

    var emailId: String = ""
    var firstName: String = ""
    var lastName: String = ""

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func setUser(emailId: String, firstName: String, lastName: String) {
        preference.userEmail = emailId
        preference.userFirstName = firstName
        preference.userLastName = lastName
        preference.isVerifiedUser = true
        goToHome()
    }
    
    func goToHome() {
        appPilot.pop()
        appPilot.push(.Home)
    }
}
