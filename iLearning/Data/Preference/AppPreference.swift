//
//  AppPreference.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import UIKit
import SwiftUI

public protocol AppPreferences {
    var isOnboardShown: Bool { get set }
    var isVerifiedUser: Bool { get set }
    var user: User? { get set }

    func clearPreference()
}

class AppPreferencesImpl: AppPreferences {

    enum Key: String {
        case isOnboardShown = "is_onboard_shown"
        case isVerifiedUser = "is_verified_user"
        case user           = "user"
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

    var user: User? {
        get {
            do {
                let data = userDefaults.data(forKey: Key.user.rawValue)
                if let data {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    return user
                }
            } catch let error {
                LogE("AppPreferences \(#function) json decode error: \(error.localizedDescription)")
            }
            return nil
        } set {
            do {
                let data = try JSONEncoder().encode(newValue)
                userDefaults.set(data, forKey: Key.user.rawValue)
            } catch let error {
                LogE("AppPreferences \(#function) json encode error: \(error.localizedDescription)")
            }
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

    func clearPreference() {
        isOnboardShown = false
        isVerifiedUser = false
    }
}
