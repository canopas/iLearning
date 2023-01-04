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

    @Published var userName: String = ""
    @Published var emailId: String = ""
    @Published var imageText: String = ""

    @Published var showAlert: Bool = false
    @Published private(set) var alert: AlertPrompt = .init(title: "", message: "")

    private var currentNonce: String = ""

    private let pilot: UIPilot<AppRoute>
    private var appleSignInDelegates: SignInWithAppleDelegates! = nil

    @Inject var preference: AppPreferences

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
            self.deleteUser()
        }, negativeBtnTitle: R.string.commonStrings.cancel_text.localized(), negativeBtnAction: {
            self.showAlert = false
        }, isPositiveBtnDestructive: true)
        showAlert = true
    }

    func deleteUser() {
        if let user = FirebaseProvider.auth.currentUser {
            user.delete { error in
                if error == nil {
                    print("XXX --- USER DELETED.")
                } else if let error = error as? NSError, error.code == 17014 {
                    self.performAppleLogin()
                } else {
                    print("XXX --- User can not be deleted.")
                }
            }
        }
    }

    func performAppleLogin() {
        self.currentNonce = NonceGenerator.randomNonceString()
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = currentNonce.sha256()

        appleSignInDelegates = SignInWithAppleDelegates { (token, firstName, lastName, email) in
            let user = User(id: self.preference.user!.id, firstName: firstName, lastName: lastName, emailId: email, password: "", loginType: .Apple)
            self.performFirebaseLogin(provider: "apple.com", token: token, user: user)
        }

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = appleSignInDelegates
        authorizationController.performRequests()
    }

    private func performFirebaseLogin(provider: String, token: String, user: User) {
        let credential = OAuthProvider.credential(withProviderID: provider, idToken: token, rawNonce: currentNonce)

        FirebaseProvider.auth
            .signIn(with: credential) { [weak self] result, error in
                guard let self = self else { return }
                if let error = error {
                    print("SignInViewModel: Firebase Error: \(error), with type Apple login.")
                    self.showAlert = true
                    self.alert = .init(message: R.string.serviceError.error_server_error.localized())
                } else if let result {
                    print("XXX --- ID :: \(result.user.uid)")
                }
            }
    }

    func deleteAccount() {

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
        do {
            try FirebaseProvider.auth.signOut()
            preference.clearPreference()
            pilot.pop()
            pilot.push(.Login)
        } catch let error {
            LogE("AccountViewModel: Signout failed with: \(error)")
        }
    }
}
