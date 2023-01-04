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
            self.performFirebaseLogin(provider: "apple.com", token: token, userData: (firstName, lastName, email))
        }

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = appleSignInDelegates
        authorizationController.performRequests()
    }

    private func performFirebaseLogin(provider: String, token: String, userData: (String, String, String)) {
        let credential = OAuthProvider.credential(withProviderID: provider, idToken: token, rawNonce: currentNonce)

        FirebaseProvider.auth
            .signIn(with: credential) { [weak self] result, error in
                guard let self = self else { return }
                if let error = error {
                    print("SignInViewModel: Firebase Error: \(error), with type Apple login.")
                    self.showAlert = true
                    self.alertText = R.string.serviceError.error_server_error.localized()
                } else if let result {
                    let id = result.user.uid
                    let user = User(id: id, firstName: userData.0, lastName: userData.1, emailId: userData.2, password: "", loginType: .Apple)
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
        print("XXX LoginViewModel ---- EmailLogin :: \(appPilot.routes)")
        appPilot.push(.EmailLogin(isForSignUp: false))
        print("XXX LoginViewModel ---- EmailLogin 2 :: \(appPilot.routes)")
    }

    func clickOnCreateAccount() {
        appPilot.push(.EmailLogin(isForSignUp: true))
    }
}
