//
//  iLearningApp.swift
//  iLearning
//
//  Created by Amisha Italiya on 10/11/22.
//

import SwiftUI

@main
struct iLearningApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        Injector.shared.initInjector()
    }

    var body: some Scene {
        WindowGroup {
            AppRouteView()
        }
    }
}
