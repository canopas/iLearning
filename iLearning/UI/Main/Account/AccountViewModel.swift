//
//  AccountViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import Combine
import UIPilot
import FirebaseAuth

class AccountViewModel: ObservableObject {

    @Inject var preference: AppPreferences

    @Published var userName: String = ""
    @Published var emailId: String = ""
    @Published var imageText: String = ""

    private let pilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.pilot = pilot
        getUserDetails()
    }

    func getUserDetails() {
        if let user = preference.user {
            if user.firstName != "" && user.lastName != "" {
                userName =  user.firstName.capitalized + " " + user.lastName.capitalized
                imageText = String(user.firstName.prefix(1) + user.lastName.prefix(1)).uppercased()
                emailId = user.emailId
            } else {
                userName = R.string.accountSettingView.unknown_text.localized()
                imageText = R.string.accountSettingView.default_image_text.localized()
                emailId = user.emailId
            }
        }
    }

    func getUser() {

    }

    func openProfileScreen() {
        pilot.push(.Profile)
    }

    func handleCellSelection(type: AccountSettingOptionType) {
        switch type {
        case .deleteAccount:
            deleteAccount()
        default:
            break
        }
    }

    func deleteAccount() {

    }

    func onSignOutClick() {
        do {
            try Auth.auth().signOut()
            preference.clearPreference()
            pilot.popTo(.Login)
        } catch let error {
            LogE("Signout failed with: \(error)")
        }
    }
}
