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
    }
}
