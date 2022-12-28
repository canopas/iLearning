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
    private var cancellable = Set<AnyCancellable>()

    @Inject var preference: AppPreferences
    @Inject var firestore: FirestoreManager

    init(pilot: UIPilot<AppRoute>, isForSignUp: Bool) {
        self.pilot = pilot
        self.isForSignUp = isForSignUp
    }

    func onSignInClick() {
        if email.isValidEmail() && password.isValidPassword() {
            let user = User(id: UUID().uuidString, firstName: "", lastName: "", emailId: self.email, password: self.password.sha256(), loginType: .Email)
            if self.isForSignUp {
                createUser(user: user)
            } else {
                loginUser(user: user)
            }
        } else {
            showAlert = true
            alertText = R.string.loginScreen.valid_input_text.localized()
        }
    }
    
    private func createUser(user: User) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] _, error in
            if let error {
                self?.showAuthErrorAlert()
                print("EmailLoginViewModel: \(#function) failed with error :: \(error.localizedDescription)")
                return
            }
            guard let self = self else { return }
            self.firestore.addUser(user: user) {
                self.preference.user = user
                self.preference.isVerifiedUser = true
                self.goToHome()
            }
        })
    }

    private func loginUser(user: User) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            if let error {
                self?.showAuthErrorAlert()
                print("EmailLoginViewModel: \(#function) failed with error :: \(error.localizedDescription)")
                return
            }
            guard let self = self else { return }
            self.preference.user = user
            self.preference.isVerifiedUser = true
            self.goToHome()
        }
    }

    private func showAuthErrorAlert() {
        showAlert = true
        alertText = R.string.loginScreen.something_went_wrong_text.localized()
        signOut()
    }

    private func goToHome() {
        pilot.popTo(.Login, inclusive: true)
        pilot.push(.Home)
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            LogE("EmailLoginViewModel: \(#function) failed with error :: \(error.localizedDescription)")
        }
    }
}
