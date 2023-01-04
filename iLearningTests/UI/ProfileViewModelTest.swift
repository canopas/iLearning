//
//  ProfileViewModelTest.swift
//  iLearningTests
//
//  Created by Amisha Italiya on 20/12/22.
//

import XCTest
import Cuckoo
import UIPilot
@testable import iLearning

final class ProfileViewModelTest: XCTestCase {

    var preferences: MockAppPreferences!
    var viewModel: ProfileViewModel!

    let pilot: UIPilot<AppRoute> = UIPilot(initial: .Profile)

    override func setUpWithError() throws {
        Injector.shared.setTestAassembler(assemblies: [FakeAppAssembly()])
        preferences = appResolve(serviceType: AppPreferences.self) as? MockAppPreferences
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetUsername() {
        stub(preferences) { stub in
            when(stub.userFirstName.get).thenReturn("Amisha")
            when(stub.userLastName.get).thenReturn("Italiya")
            when(stub.userEmailId.get).thenReturn("amisha@gmail.com")
        }

        viewModel = ProfileViewModel(pilot: pilot)

        XCTAssertEqual("Amisha", viewModel.firstName)
        XCTAssertEqual("Italiya", viewModel.lastName)
        XCTAssertEqual("amisha@gmail.com", viewModel.emailId)
    }

    func testOnSaveButtonClick() {

        stub(preferences) { stub in
            when(stub.userFirstName.get).thenReturn("Amisha")
            when(stub.userLastName.get).thenReturn("Italiya")
            when(stub.userEmailId.get).thenReturn("amisha@gmail.com")

            when(stub.userEmailId.set(anyString())).thenDoNothing()
            when(stub.userFirstName.set(anyString())).thenDoNothing()
            when(stub.userLastName.set(anyString())).thenDoNothing()
        }

        viewModel = ProfileViewModel(pilot: pilot)

        viewModel.firstName = "Amisha"
        viewModel.lastName = "Italiya"
        viewModel.emailId = "amisha@gmail.com"

        viewModel.onSaveBtnClick()

        verify(preferences).userFirstName.set("Amisha")
        verify(preferences).userLastName.set("Italiya")
        verify(preferences).userEmailId.set("amisha@gmail.com")

// OR
//        XCTAssertEqual(viewModel.firstName, preferences.userFirstName)
//        XCTAssertEqual(viewModel.lastName, preferences.userLastName)
//        XCTAssertEqual(viewModel.emailId, preferences.userEmailId)

        if let lastRoute = pilot.routes.last {
            XCTAssertNotEqual(AppRoute.Profile, lastRoute)
        }
    }
}
