//
//  AccountViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import Combine
import UIPilot
import FirebaseAuth
import AuthenticationServices

class AccountViewModel: ObservableObject {

    private let ERROR_CODE_REQUIRED_RECRENT_LOGIN = 17014

    @Published var userName: String = ""
    @Published var emailId: String = ""
    @Published var imageText: String = ""

    @Published var showEmailSignInPrompt = false

    @Published var showAlert: Bool = false
    @Published private(set) var alert: AlertPrompt = .init(title: "", message: "")

    private var currentNonce: String = ""
    private var cancellable = Set<AnyCancellable>()

    let pilot: UIPilot<AppRoute>
    private var appleSignInDelegates: SignInWithAppleDelegates! = nil

    @Inject var authHandler: AuthHandler
    @Inject var preference: AppPreferences
    @Inject var firestore: FirestoreManager

    init(pilot: UIPilot<AppRoute>) {
        self.pilot = pilot
    }

    func getUserDetails() {
        if let user = preference.user {
            emailId = user.emailId
            if user.firstName != "" || user.lastName != "" {
                userName =  user.firstName.capitalized + " " + user.lastName.capitalized
                imageText = String(user.firstName.prefix(1) + user.lastName.prefix(1)).uppercased()
            } else {
                userName = R.string.accountSettingView.unknown_text.localized()
                imageText = R.string.accountSettingView.default_image_text.localized()
            }
        }
    }

    func openProfileScreen() {
        pilot.push(.Profile)
    }

    func handleCellSelection(type: AccountSettingOptionType) {
        switch type {
        case .deleteAccount:
            handleDeleteAction()
        default:
            break
        }
    }

    func handleDeleteAction() {
        alert = .init(title: R.string.commonStrings.warning_text.localized(), message: R.string.commonStrings.delete_alert_text.localized(), positiveBtnTitle: R.string.commonStrings.delete_text.localized(), positiveBtnAction: {
            self.deleteUserAccount()
        }, negativeBtnTitle: R.string.commonStrings.cancel_text.localized(), negativeBtnAction: {
            self.showAlert = false
        }, isPositiveBtnDestructive: true)
        showAlert = true
    }

    func deleteUserAccount() {
        if let currentUser = authHandler.currentUser {
            currentUser.delete { [weak self] error in
                guard let self = self else { return }
                if error == nil {
                    if let id = self.preference.user?.id {
                        self.firestore.deleteUser(id: id)
                            .receive(on: DispatchQueue.main)
                            .sink { completion in
                                switch completion {
                                case .failure(let error):
                                    self.alert = .init(message: error.localizedDescription)
                                    self.showAlert = true
                                case .finished:
                                    self.preference.clearPreference()
                                }
                            } receiveValue: { [weak self] _ in
                                self?.goToRoot()
                            }
                            .store(in: &self.cancellable)
                    }
                } else if let error = error as? NSError, error.code == self.ERROR_CODE_REQUIRED_RECRENT_LOGIN {
                    if let preferenceUser = self.preference.user {
                        if preferenceUser.loginType == .Apple {
                            self.promptForAppleLogin()
                        } else {
                            self.promptForEmailLogin()
                        }
                    }
                } else {
                    self.alert = .init(message: R.string.commonStrings.contact_support.localized())
                    self.showAlert = true
                }
            }
        }
    }

    func promptForEmailLogin() {
        showEmailSignInPrompt = true
    }

    func onEmailLoginSuccess() {
        showEmailSignInPrompt = false
    }

    func promptForAppleLogin() {
        self.currentNonce = NonceGenerator.randomNonceString()
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = currentNonce.sha256()

        appleSignInDelegates = SignInWithAppleDelegates { (token, _, _, email) in
            self.performFirebaseLogin(provider: "apple.com", token: token, loginType: .Apple, userEmailId: email)
        }

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = appleSignInDelegates
        authorizationController.performRequests()
    }

    private func performFirebaseLogin(provider: String, token: String, loginType: LoginType, userEmailId: String) {
        let credential = OAuthProvider.credential(withProviderID: provider, idToken: token, rawNonce: currentNonce)

        FirebaseProvider.auth
            .signIn(with: credential) { [weak self] result, error in
                guard let self = self else { return }
                if let error = error {
                    print("SignInViewModel: Firebase Error: \(error), with type Apple login.")
                    self.alert = .init(message: R.string.serviceError.error_server_error.localized())
                    self.showAlert = true
                } else if let result {
                    self.checkForUserExistance(userId: result.user.uid)
                } else {
                    self.alert = .init(message: R.string.commonStrings.contact_support.localized())
                    self.showAlert = true
                }
            }
    }

    func checkForUserExistance(userId: String) {
        firestore.fetchUsers()
            .sink { _ in
            } receiveValue: { [weak self] users in
                guard let self = self else { return }
                let searchedUser = users.first(where: { $0.id == userId })

                if searchedUser != nil {
                    self.deleteUserAccount()
                } else {
                    self.alert = .init(message: R.string.commonStrings.troubleshoot_user_not_found.localized())
                    self.showAlert = true
                }
            }
            .store(in: &cancellable)
    }

    func onSignOutClick() {
        alert = .init(title: R.string.commonStrings.warning_text.localized(), message: R.string.commonStrings.sign_out_text.localized(), positiveBtnTitle: R.string.commonStrings.yes_text.localized(), positiveBtnAction: {
            self.performSignOut()
        }, negativeBtnTitle: R.string.commonStrings.cancel_text.localized(), negativeBtnAction: {
            self.showAlert = false
        })
        showAlert = true
    }

    func performSignOut() {
        authHandler.signOut()
        preference.clearPreference()
        goToRoot()
    }

    func goToRoot() {
        pilot.pop()
        pilot.push(.Login)
    }
}
