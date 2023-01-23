//
//  FakeAppAssembly.swift
//  iLearningTests
//
//  Created by Amisha Italiya on 22/12/22.
//

import Swinject
import iLearning

public class FakeAppAssembly: Assembly {

    public init() { }

    public func assemble(container: Container) {
        container.register(AppPreferences.self) { _ in
            MockAppPreferences()
        }.inObjectScope(.container)
        
        container.register(FirestoreManager.self) { _ in
            MockFirestoreManager()
        }.inObjectScope(.container)
        
        container.register(LanguageManger.self) { _ in
            LanguageManger.init()
        }.inObjectScope(.container)
    }
}
