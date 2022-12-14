//
//  ProfileViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import UIPilot

class ProfileViewModel: ObservableObject {

    @Inject var preference: AppPreference

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
            emailId = preference.userEmail
            firstName = preference.userFirstName
            lastName = preference.userLastName
            imageText = String(preference.userFirstName.capitalized.prefix(1) + preference.userLastName.capitalized.prefix(1))
        } else {
            imageText = "UN"
            emailId = preference.userEmail
        }
    }

    func onSaveBtnClick() {
        preference.userEmail = emailId
        preference.userFirstName = firstName
        preference.userLastName = lastName
        pilot.pop()
    }
}
