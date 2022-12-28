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
    @Inject var firestore: FirestoreManager

    private let appPilot: UIPilot<AppRoute>
    private var cancellable = Set<AnyCancellable>()

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func setUser(emailId: String, firstName: String, lastName: String) {
        let user = User(id: UUID().uuidString, firstName: firstName, lastName: lastName, emailId: emailId, password: "", loginType: .Apple)
        checkForUserExistance(user: user)
    }

    private func checkForUserExistance(user: User) {
        firestore.fetchUsers()
            .sink { _ in
            } receiveValue: { users in
                let searchedUser = users.first(where: { $0.emailId == user.emailId && $0.firstName == user.firstName && $0.lastName == user.lastName })
                if let searchedUser {
                    self.preference.user = searchedUser
                    self.preference.isVerifiedUser = true
                    self.goToHome()
                } else {
                    self.firestore.createUserDatabase(user: user) {
                        self.preference.user = user
                        self.preference.isVerifiedUser = true
                        self.goToHome()
                    }
                }
            }
            .store(in: &cancellable)
    }

    private func goToHome() {
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
