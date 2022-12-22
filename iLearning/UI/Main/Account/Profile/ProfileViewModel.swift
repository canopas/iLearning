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
        if preference.userFirstName != "" && preference.userLastName != "" {
            emailId = preference.userEmailId
            firstName = preference.userFirstName
            lastName = preference.userLastName
            imageText = String(preference.userFirstName.capitalized.prefix(1) + preference.userLastName.capitalized.prefix(1))
        } else {
            imageText = R.string.profileView.default_image_text.localized()
            emailId = preference.userEmailId
        }
    }

    func onSaveBtnClick() {
        preference.userEmailId = emailId
        preference.userFirstName = firstName
        preference.userLastName = lastName
        pilot.pop()
    }
}
