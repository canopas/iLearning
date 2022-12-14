//
//  AppAssembly.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import Foundation
import Swinject
import UIPilot

public class AppAssembly: Assembly {

    public init() { }

    public func assemble(container: Container) {

        container.register(LanguageManger.self) { _ in
            LanguageManger.init()
        }.inObjectScope(.container)

        container.register(AppPreferences.self) { _ in
            AppPreferencesImpl.init()
        }.inObjectScope(.container)

        container.register(FirestoreManager.self) { _ in
            FirestoreManagerImpl.init()
        }.inObjectScope(.container)
    }
}
