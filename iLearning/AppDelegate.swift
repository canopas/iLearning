//
//  AppDelegate.swift
//  iLearning
//
//  Created by Amisha Italiya on 10/11/22.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseProvider.configureFirebase()
        return true
    }
}
