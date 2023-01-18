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
    @Published private(set) var alert: AlertPrompt = .init(title: "", message: "")

    private let pilot: UIPilot<AppRoute>

    private var onLoginSuccess: (() -> Void)?
    private var cancellable = Set<AnyCancellable>()

    @Inject var preference: AppPreferences
    @Inject var firestore: FirestoreManager

    init(pilot: UIPilot<AppRoute>, isForSignUp: Bool, onLoginSuccess: (() -> Void)? = nil) {
        self.pilot = pilot
        self.isForSignUp = isForSignUp
        self.onLoginSuccess = onLoginSuccess
    }

    func onSignInClick() {
        if email.isValidEmail() && password.isValidPassword() {
            if self.isForSignUp {
                createUser()
            } else {
                loginUser()
            }
        } else {
            alert = .init(message: R.string.loginScreen.valid_input_text.localized())
            showAlert = true
        }
    }

    private func createUser() {
        FirebaseProvider.auth
            .createUser(withEmail: email, password: password, completion: { [weak self] result, error in
                guard let self = self else { return }
                if let error {
                    self.showAuthErrorAlert()
                    LogE("EmailLoginViewModel: \(#function) failed with error :: \(error.localizedDescription)")
                    return
                } else if let result {
                    self.storeUser(userId: result.user.uid)
                } else {
                    self.alert = .init(message: R.string.commonStrings.contact_support.localized())
                    self.showAlert = true
                }
            })
    }

    private func loginUser() {
        FirebaseProvider.auth
            .signIn(withEmail: email, password: password) { [weak self] result, error in
                guard let self = self else { return }
                if let error {
                    self.showAuthErrorAlert()
                    LogE("EmailLoginViewModel: \(#function) failed with error :: \(error.localizedDescription)")
                    return
                } else if let result {
                    self.storeUser(userId: result.user.uid)
                } else {
                    self.alert = .init(message: R.string.commonStrings.contact_support.localized())
                    self.showAlert = true
                }
            }
    }

    private func storeUser(userId: String) {
        firestore.fetchUsers()
            .sink { _ in
            } receiveValue: { [weak self] users in
                guard let self = self else { return }
                let searchedUser = users.first(where: { $0.id == userId })

                if let searchedUser {
                    self.preference.user = searchedUser
                    self.preference.isVerifiedUser = true
                    self.goToHome()
                } else {
                    let user = User(id: userId, firstName: "", lastName: "", emailId: self.email, password: self.password.sha256(), loginType: .Email)
                    self.firestore.addUser(user: user)
                        .receive(on: DispatchQueue.main)
                        .sink { completion in
                            switch completion {
                            case .failure(let error):
                                self.alert = .init(message: error.localizedDescription)
                                self.showAlert = true
                            case .finished:
                                self.preference.user = user
                                self.preference.isVerifiedUser = true
                                self.goToHome()
                            }
                        } receiveValue: { _ in
                        }
                        .store(in: &self.cancellable)
                }
                self.onLoginSuccess?()
            }
            .store(in: &cancellable)
    }

    private func showAuthErrorAlert() {
        alert = .init(message: R.string.loginScreen.something_went_wrong_text.localized())
        showAlert = true
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
