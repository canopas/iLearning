//
//  ProfileViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import UIPilot

class ProfileViewModel: ObservableObject {

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailId: String = ""
    @Published var imageText: String = ""

    private let pilot: UIPilot<AppRoute>

    @Inject var preference: AppPreferences
    @Inject var firestore: FirestoreManager

    init(pilot: UIPilot<AppRoute>) {
        self.pilot = pilot
        setUserName()
    }

    func setUserName() {
        if let user = preference.user {
            emailId = user.emailId
            firstName = user.firstName
            lastName = user.lastName
            if user.firstName != "" || user.lastName != "" {
                imageText = String(user.firstName.prefix(1) + user.lastName.prefix(1)).uppercased()
            } else {
                imageText = R.string.profileView.default_image_text.localized()
            }
        }
    }

    func onSaveBtnClick() {
        if let user = preference.user {
            let user = User(id: user.id, firstName: firstName, lastName: lastName, emailId: user.emailId, password: user.password, loginType: user.loginType)
            firestore.updateUser(user: user) {
                self.preference.user = user
                self.pilot.pop()
            }
        }
    }
}
