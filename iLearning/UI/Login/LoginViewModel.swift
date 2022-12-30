//
//  LoginViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 09/12/22.
//

import Combine
import UIPilot
import FirebaseAuth
import AuthenticationServices

class LoginViewModel: ObservableObject {

    @Published var showAlert: Bool = false
    @Published var alertText: String = ""

    private let appPilot: UIPilot<AppRoute>
    private var appleSignInDelegates: SignInWithAppleDelegates! = nil

    private var currentNonce: String = ""
    private var cancellable = Set<AnyCancellable>()

    @Inject var preference: AppPreferences
    @Inject var firestore: FirestoreManager

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onAppleLoginClick() {
        self.currentNonce = NonceGenerator.randomNonceString()
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = currentNonce.sha256()

        appleSignInDelegates = SignInWithAppleDelegates { (token, firstName, lastName, email) in
            let user = User(id: UUID().uuidString, firstName: firstName, lastName: lastName, emailId: email, password: "", loginType: .Apple)
            self.performFirebaseLogin(provider: "apple.com", token: token, user: user)
        }

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = appleSignInDelegates
        authorizationController.performRequests()
    }

    private func performFirebaseLogin(provider: String, token: String, user: User) {
        let credential = OAuthProvider.credential(withProviderID: provider, idToken: token, rawNonce: currentNonce)

        FirebaseProvider.auth
            .signIn(with: credential) { [weak self] _, error in
                guard let self = self else { return }
                if let error = error {
                    print("SignInViewModel: Firebase Error: \(error), with type Apple login.")
                    self.showAlert = true
                    self.alertText = R.string.serviceError.error_server_error.localized()
                } else {
                    self.storeUser(user: user)
                }
            }
    }

    private func storeUser(user: User) {
        firestore.fetchUsers()
            .sink { _ in
            } receiveValue: { [weak self] users in
                guard let self = self else { return }
                let searchedUser = users.first(where: { $0.emailId == user.emailId })

                if let searchedUser {
                    self.preference.user = searchedUser
                    self.preference.isVerifiedUser = true
                    self.goToHome()
                } else {
                    self.firestore.addUser(user: user) {
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
