//
//  ProfileViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import UIPilot

class ProfileViewModel: ObservableObject {

    @Inject var preference: AppPreferences

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailId: String = ""
    @Published var imageText: String = ""

    private let pilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.pilot = pilot
        setUserName()
    }

    func setUserName() {
        if let user = preference.user {
            if user.firstName != "" && user.lastName != "" {
                emailId = user.emailId
                firstName = user.firstName
                lastName = user.lastName
                imageText = String(user.firstName.prefix(1) + user.lastName.prefix(1)).uppercased()
            } else {
                imageText = R.string.profileView.default_image_text.localized()
                emailId = user.emailId
            }
        }
    }

    func onSaveBtnClick() {
        self.preference.user?.emailId = emailId
        self.preference.user?.firstName = firstName
        self.preference.user?.lastName = lastName
        pilot.pop()
    }
}
