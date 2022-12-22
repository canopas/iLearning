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
        if preference.userFirstName != "" && preference.userLastName != "" {
            userName =  preference.userFirstName.capitalized + " " + preference.userLastName.capitalized
            imageText = String(preference.userFirstName.capitalized.prefix(1) + preference.userLastName.capitalized.prefix(1))
            emailId = preference.userEmailId
        } else {
            userName = R.string.accountSettingView.unknown_text.localized()
            imageText = R.string.accountSettingView.default_image_text.localized()
            emailId = preference.userEmailId
        }
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
            preference.isVerifiedUser = false
        } catch let error {
            LogE("Signout failed with: \(error)")
        }
    }
}
