//
//  AppDelegate.swift
//  iLearning
//
//  Created by Amisha Italiya on 10/11/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
//        let database = Firestore.firestore()
        return true
    }
}
