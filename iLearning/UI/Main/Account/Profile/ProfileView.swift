//
//  ProfileView.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                VSpacer(10)

                Text(viewModel.imageText)
                    .font(.system(size: 50).bold())
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150, alignment: .center)
                    .background(Color.gray)
                    .clipShape(Circle())

                VSpacer(20)

                UnderlinedTextField(fieldName: .constant(R.string.profileView.first_name_text.localized()), bindingValue: $viewModel.firstName)

                UnderlinedTextField(fieldName: .constant(R.string.profileView.last_name_text.localized()), bindingValue: $viewModel.lastName)

                UnderlinedTextField(fieldName: .constant(R.string.profileView.email_text.localized()), bindingValue: $viewModel.emailId)
                    .disabled(true)

                VSpacer(20)

                PrimaryButton(text: R.string.profileView.save_text.localized()) {
                    viewModel.onSaveBtnClick()
                }

                VSpacer()
            }
            .padding(.horizontal, 30)
        }
        .onAppear {
            viewModel.setUserName()
        }
        .backport.alert(isPresented: $viewModel.showAlert, alertStruct: viewModel.alert)
        .navigationTitle(R.string.profileView.user_profile_text.localized())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(pilot: .init()))
    }
}
