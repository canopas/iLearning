//
//  ProfileViewModel.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import UIPilot
import Combine

class ProfileViewModel: ObservableObject {

    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailId: String = ""
    @Published var imageText: String = ""

    @Published var showAlert: Bool = false
    @Published private(set) var alert: AlertPrompt = .init(title: "", message: "")

    private var cancellable = Set<AnyCancellable>()

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
            let user = AppUser(id: user.id, firstName: firstName, lastName: lastName, emailId: user.emailId, password: user.password, loginType: user.loginType)
            self.firestore.updateUser(user: user)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        self.alert = .init(message: error.localizedDescription)
                        self.showAlert = true
                    case .finished:
                        self.preference.user = user
                    }
                } receiveValue: { [weak self] _ in
                    self?.pilot.pop()
                }
                .store(in: &self.cancellable)
        }
    }
}
