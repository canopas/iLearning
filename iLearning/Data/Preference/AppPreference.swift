//
//  AppPreference.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import Foundation

public class AppPreference {

    enum Key: String {
        case isOnboardShown = "is_onboard_shown"
        case isVerifiedUser = "is_verified_user"
        case userFirstName  = "user_first_name"
        case userLastName   = "user_last_name"
        case userEmailId    = "user_email_id"
    }

    private let userDefaults: UserDefaults

    init() {
        self.userDefaults = UserDefaults.standard
    }

    public var isOnboardShown: Bool {
        get {
            return userDefaults.bool(forKey: Key.isVerifiedUser.rawValue)
        } set {
            userDefaults.set(newValue, forKey: Key.isVerifiedUser.rawValue)
            userDefaults.synchronize()
        }
    }

    public var isVerifiedUser: Bool {
        get {
            return userDefaults.bool(forKey: Key.isOnboardShown.rawValue)
        } set {
            userDefaults.set(newValue, forKey: Key.isOnboardShown.rawValue)
            userDefaults.synchronize()
        }
    }

    public var userFirstName: String {
        get {
            return userDefaults.string(forKey: Key.userFirstName.rawValue) ?? ""
        } set {
            userDefaults.set(newValue, forKey: Key.userFirstName.rawValue)
            userDefaults.synchronize()
        }
    }

    public var userLastName: String {
        get {
            return userDefaults.string(forKey: Key.userLastName.rawValue) ?? ""
        } set {
            userDefaults.set(newValue, forKey: Key.userLastName.rawValue)
            userDefaults.synchronize()
        }
    }

    public var userEmail: String {
        get {
            return userDefaults.string(forKey: Key.userEmailId.rawValue) ?? ""
        } set {
            userDefaults.set(newValue, forKey: Key.userEmailId.rawValue)
            userDefaults.synchronize()
        }
    }
}
