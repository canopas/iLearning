//
//  AccountView.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import SwiftUI

struct AccountView: View {

    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                VStack(spacing: 0) {
                    Text(viewModel.imageText)
                        .font(.system(size: 50).bold())
                        .foregroundColor(.white)
                        .frame(width: 120, height: 120, alignment: .center)
                        .background(Color.gray)
                        .clipShape(Circle())

                    VSpacer(20)

                    Text(viewModel.userName)
                        .font(.system(size: 22).weight(.light))
                        .foregroundColor(.black)

                    VSpacer(5)

                    Text(viewModel.emailId)
                        .font(.caption)
                }
                .padding(.horizontal, 50)
                .onTapGesture {
                    viewModel.openProfileScreen()
                }

                AccountSettingListView(cellSelection: { cellType in
                    viewModel.handleCellSelection(type: cellType)
                })

                Button {
                    viewModel.onSignOutClick()
                } label: {
                    Text(R.string.accountSettingView.sign_out_text.localized())
                        .font(.headline)
                        .foregroundColor(.red)
                }

                VSpacer(5)
            }
            .padding(.horizontal, 20)

            Spacer()
        }
        .onAppear {
            viewModel.getUserDetails()
        }
        .navigationBarIsHidden(false)
    }
}

private struct AccountSettingListView: View {

    let cellSelection: ((AccountSettingOptionType) -> Void)

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(R.string.accountSettingView.account_setting_text.localized())
                    .font(.headline.bold())
                    .foregroundColor(.gray)

                HSpacer()
            }
            .padding(.leading, 5)

            VStack(spacing: 0) {
                VSpacer(18)

                VStack(spacing: 15) {
                    ForEach(AccountSettingOptionType.allCases, id: \.id) { cell in
                        AccountSettingOptionCell(cell: cell, cellSelection: cellSelection)

                        Divider()
                            .frame(height: 2)
                            .foregroundColor(.gray.opacity(0.8))
                    }
                }
            }
            .padding(.horizontal, 5)
            .background(Color.gray.opacity(0.15))
            .cornerRadius(10)
        }
    }
}

private struct AccountSettingOptionCell: View {

    let cell: AccountSettingOptionType
    let cellSelection: ((AccountSettingOptionType) -> Void)

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(cell.cellTitle)
                        .font(.system(size: 18).weight(.medium))
                }

                Spacer()

                if cell.showArrow {
                    ForwordIcon()
                }
            }
            .padding(.leading, 15)
        }
        .onTouchGesture {
            cellSelection(cell)
        }
    }
}

private struct ForwordIcon: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(.black.opacity(0.8))
                .aspectRatio(contentMode: .fill)
                .frame(width: 8, height: 12, alignment: .center)
        }
        .padding(.horizontal, 24)
    }
}

enum AccountSettingOptionType: String, CaseIterable {
    case downloadOption
    case emailNotification
    case pushNotification
    case aboutiLearning
    case helpNsupport
    case accountSecurity
    case deleteAccount

    var id: String {
        return rawValue
    }

    var cellTitle: String {
        switch self {
        case .downloadOption:
            return R.string.accountSettingView.download_option_text.localized()
        case .emailNotification:
            return R.string.accountSettingView.email_notification_text.localized()
        case .pushNotification:
            return R.string.accountSettingView.push_notification_text.localized()
        case .aboutiLearning:
            return R.string.accountSettingView.about_ilearning_text.localized()
        case .helpNsupport:
            return R.string.accountSettingView.help_n_support_text.localized()
        case .accountSecurity:
            return R.string.accountSettingView.account_security_text.localized()
        case .deleteAccount:
            return R.string.accountSettingView.delete_account_text.localized()
        }
    }

    var showArrow: Bool {
        switch self {
        case .deleteAccount:
            return false
        default:
            return true
        }
    }
}
