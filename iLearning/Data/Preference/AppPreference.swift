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
    }

    private let userDefaults: UserDefaults
    
    init() {
        self.userDefaults = UserDefaults.standard
    }
    
    public var isOnboardShown: Bool {
        get {
            return userDefaults.bool(forKey: Key.isOnboardShown.rawValue)
        } set {
            userDefaults.set(newValue, forKey: Key.isOnboardShown.rawValue)
            userDefaults.synchronize()
        }
    }
}
