//
//  LoginView.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI
import UIKit
import AuthenticationServices

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                KFAnimatedImage(resource: Bundle.main.url(forResource: "online-education", withExtension: "gif"))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.8, alignment: .center)

                Text(R.string.loginScreen.login_screen_text.localized())
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)

                ButtonDividerView()

                SignInWithAppleButton(.continue) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    switch result {
                    case .success(let authorization):
                        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                            viewModel.setUser(emailId: appleIDCredential.email ?? "",
                                              firstName: appleIDCredential.fullName?.givenName ?? "",
                                              lastName: appleIDCredential.fullName?.familyName ?? "")
                        }
                    case .failure(let error):
                        LogE("Apple authorisation failed: \(error.localizedDescription)")
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50, alignment: .center)

                Spacer()
            }
            .padding(20)
        }
    }
}

struct ButtonDividerView: View {

    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .frame(width: 100, height: 1.0, alignment: .bottom)
                .foregroundColor(.gray)

            Text(R.string.loginScreen.options_text.localized())
                .font(.caption)
                .foregroundColor(.gray)

            Rectangle()
                .frame(width: 100, height: 1.0, alignment: .bottom)
                .foregroundColor(.gray)
        }
    }
}
