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
            VStack(alignment: .center, spacing: 20) {
                VSpacer(30)

                Text(R.string.loginScreen.sign_in_or_up_text.localized())
                    .font(.title.bold())

                KFAnimatedImage(resource: Bundle.main.url(forResource: "online-education", withExtension: "gif"))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.8, alignment: .center)

                Text(R.string.loginScreen.login_screen_text.localized())
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)

                VStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        viewModel.onAppleLoginClick()
                    }, label: {
                        Text(R.string.loginScreen.sign_in_with_apple_text.localized())
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 50)
                            .background(.black)
                            .minimumScaleFactor(0.5)
                            .clipShape(Capsule())
                    })
                    .buttonStyle(.scale)

                    PrimaryButton(text: R.string.loginScreen.sign_in_with_email_text.localized()) {
                        viewModel.clickOnEmailLogin()
                    }

                    ButtonDividerView(text: R.string.loginScreen.or_options_text.localized())

                    SecondaryButton(text: R.string.loginScreen.create_account_text.localized()) {
                        viewModel.clickOnCreateAccount()
                    }
                    .padding(.horizontal, 3)
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .center)

                VSpacer()
            }
            .padding(.horizontal, 20)
            .navigationBarIsHidden(true)
        }
    }
}

struct ButtonDividerView: View {

    var text: String

    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .frame(width: 100, height: 1.0, alignment: .bottom)
                .foregroundColor(.gray)

            Text(text)
                .font(.caption)
                .foregroundColor(.gray)

            Rectangle()
                .frame(width: 100, height: 1.0, alignment: .bottom)
                .foregroundColor(.gray)
        }
    }
}
