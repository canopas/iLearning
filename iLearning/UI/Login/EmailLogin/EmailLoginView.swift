//
//  EmailLoginView.swift
//  iLearning
//
//  Created by Amisha Italiya on 12/12/22.
//

import SwiftUI

struct EmailLoginView: View {

    @ObservedObject var viewModel: EmailLoginViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            KFAnimatedImage(resource: Bundle.main.url(forResource: "online-study", withExtension: "gif"))
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.8, alignment: .center)

            VStack(alignment: .center, spacing: 20) {
                Text(R.string.loginScreen.continue_with_email_text.localized())
                    .font(.title.bold())

                VSpacer(0)

                TextField(R.string.loginScreen.enter_email_text.localized(), text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .textFieldStyle(OutlinedTextFieldStyle())

                SecureField(R.string.loginScreen.enter_password_text.localized(), text: $viewModel.password)
                    .textFieldStyle(OutlinedTextFieldStyle())

                VSpacer(0)

                PrimaryButton(text: viewModel.isForSignUp ? R.string.loginScreen.sign_up_text.localized() :
                                R.string.loginScreen.sign_in_text.localized()) {
                    viewModel.onSignInClick()
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .center)

            VSpacer()
        }
        .padding(20)
        .backport.alert(isPresented: $viewModel.showAlert, alertStruct: viewModel.alert)
        .navigationBarIsHidden(false)
    }
}
