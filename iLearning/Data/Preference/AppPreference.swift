//
//  AppPreference.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import Foundation

public protocol AppPreferences {
    var isOnboardShown: Bool { get set }
    var loginType: LoginType { get set }
    var isVerifiedUser: Bool { get set }
    var userFirstName: String { get set }
    var userLastName: String { get set }
    var userEmailId: String { get set }

    func clearPreference()
}

class AppPreferencesImpl: AppPreferences {

    enum Key: String {
        case isOnboardShown = "is_onboard_shown"
        case loginType      = "login_type"
        case isVerifiedUser = "is_verified_user"
        case userFirstName  = "user_first_name"
        case userLastName   = "user_last_name"
        case userEmailId    = "user_email_id"
    }

    private let userDefaults: UserDefaults

    init() {
        self.userDefaults = UserDefaults.standard
    }

    var isOnboardShown: Bool {
        get {
            return userDefaults.bool(forKey: Key.isVerifiedUser.rawValue)
        } set {
            userDefaults.set(newValue, forKey: Key.isVerifiedUser.rawValue)
            userDefaults.synchronize()
        }
    }

    var loginType: LoginType {
        get {
            return LoginType(rawValue: userDefaults.string(forKey: Key.loginType.rawValue) ?? "None") ?? .None
        } set {
            userDefaults.set(newValue.rawValue, forKey: Key.loginType.rawValue)
        }
    }

    var isVerifiedUser: Bool {
        get {
            return userDefaults.bool(forKey: Key.isOnboardShown.rawValue)
        } set {
            userDefaults.set(newValue, forKey: Key.isOnboardShown.rawValue)
            userDefaults.synchronize()
        }
    }

    var userFirstName: String {
        get {
            return userDefaults.string(forKey: Key.userFirstName.rawValue) ?? ""
        } set {
            userDefaults.set(newValue, forKey: Key.userFirstName.rawValue)
            userDefaults.synchronize()
        }
    }

    var userLastName: String {
        get {
            return userDefaults.string(forKey: Key.userLastName.rawValue) ?? ""
        } set {
            userDefaults.set(newValue, forKey: Key.userLastName.rawValue)
            userDefaults.synchronize()
        }
    }

    var userEmailId: String {
        get {
            return userDefaults.string(forKey: Key.userEmailId.rawValue) ?? ""
        } set {
            userDefaults.set(newValue, forKey: Key.userEmailId.rawValue)
            userDefaults.synchronize()
        }
    }

    func clearPreference() {
        isOnboardShown = false
        isVerifiedUser = false
        userFirstName = ""
        userLastName = ""
        userEmailId = ""
    }
}
