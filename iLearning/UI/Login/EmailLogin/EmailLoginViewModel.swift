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

    init(pilot: UIPilot<AppRoute>, isForSignUp: Bool) {
        self.pilot = pilot
        self.isForSignUp = isForSignUp
    }

    func onSignInClick() {
        if isValidEmail(email) && isValidPassword(password) {
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

// MARK: - Helper Methods
extension EmailLoginViewModel {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        let minPasswordLength = 6
        return password.count >= minPasswordLength
    }
}
