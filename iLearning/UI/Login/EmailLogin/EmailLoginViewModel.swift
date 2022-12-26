//
//  EmailLoginViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 12/12/22.
//

import Combine
import UIPilot
import SwiftUI
import FirebaseAuth

class EmailLoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isForSignUp: Bool

    @Published var showAlert: Bool = false
    @Published var alertText: String = ""

    private let pilot: UIPilot<AppRoute>

    @Inject var preference: AppPreferences
    @Inject var firestore: FirestoreManager

    init(pilot: UIPilot<AppRoute>, isForSignUp: Bool) {
        self.pilot = pilot
        self.isForSignUp = isForSignUp
    }

    func onSignInClick() {
        if email.isValidEmail() && password.isValidPassword() {
            if isForSignUp {
                createUser()
            } else {
                loginUser()
            }
        } else {
            showAlert = true
            alertText = R.string.loginScreen.valid_input_text.localized()
        }
    }

    func goToHome() {
        pilot.popTo(.Login, inclusive: true)
        pilot.push(.Home)
    }

    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            if let error {
                self?.showAuthErrorAlert()
                LogE("EmailLoginViewModel: loginUser Failed :: \(error)")
                return
            }
            guard let self = self else { return }
            self.preference.loginType = .Email
            self.preference.isVerifiedUser = true
            self.preference.userEmailId = self.email
            let user = User(id: UUID().uuidString, firstName: "", lastName: "", emailId: self.email.capitalized, password: self.password.sha256(), loginType: .Email)
            self.firestore.createUserDatabase(user: user)
            self.goToHome()
        }
    }

    func createUser() {
        Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] _, error in
            if let error {
                self?.showAuthErrorAlert()
                LogE("EmailLoginViewModel: createUser Failed :: \(error)")
                return
            }
            guard let self = self else { return }
            self.preference.loginType = .Email
            self.preference.isVerifiedUser = true
            self.preference.userEmailId = self.email
            let user = User(id: UUID().uuidString, firstName: "", lastName: "", emailId: self.email, password: self.password.sha256(), loginType: .Email)
            self.firestore.createUserDatabase(user: user)
            self.goToHome()
        })
    }

    func showAuthErrorAlert() {
        showAlert = true
        alertText = R.string.loginScreen.something_went_wrong_text.localized()
        signOut()
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            LogE("EmailLoginViewModel: Sign Out Failed :: \(error)")
        }
    }
}
