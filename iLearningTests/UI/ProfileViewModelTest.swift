//
//  ProfileViewModelTest.swift
//  iLearningTests
//
//  Created by Amisha Italiya on 20/12/22.
//

import XCTest
import Cuckoo
import UIPilot
import Combine
@testable import iLearning

final class ProfileViewModelTest: XCTestCase {

    var viewModel: ProfileViewModel!
    var mockPreference: MockAppPreferences!
    var mockFirestore: MockFirestoreManager!

    let pilot: UIPilot<AppRoute> = UIPilot(initial: .Profile)
    
    let user = AppUser(id: "123", firstName: "Amisha", lastName: "Italiya", emailId: "amisha.i@canopas.com", password: "amisha_123", loginType: .Apple)

    override func setUpWithError() throws {
        Injector.shared.setTestAassembler(assemblies: [FakeAppAssembly()])
        mockPreference = appResolve(serviceType: AppPreferences.self) as? MockAppPreferences
        mockFirestore = appResolve(serviceType: FirestoreManager.self) as? MockFirestoreManager
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelInitialization() {

        stub(mockPreference) { mock in
            when(mock.user.get).thenReturn(user)
        }
        
        viewModel = ProfileViewModel(pilot: pilot)
        
        XCTAssertEqual(viewModel.firstName, "Amisha")
        XCTAssertEqual(viewModel.lastName, "Italiya")
        XCTAssertEqual(viewModel.emailId, "amisha.i@canopas.com")
    }
    
    func testSetUserName() {
        stub(mockPreference) { mock in
            when(mock.user.get).thenReturn(user)
        }
        
        viewModel = ProfileViewModel(pilot: pilot)
        viewModel.setUserName()
        
        XCTAssertEqual(viewModel.firstName, "Amisha")
        XCTAssertEqual(viewModel.lastName, "Italiya")
        XCTAssertEqual(viewModel.emailId, "amisha.i@canopas.com")
    }
    
    func testOnSaveButtonClickSuccess() {
        
        stub(mockPreference) { mock in
            when(mock.user).get.thenReturn(user)
            when(mock.user).set(any()).thenDoNothing()
        }
        
        let expectedResult = Just(Void()).setFailureType(to: Error.self).eraseToAnyPublisher()
        let newUser = AppUser(id: user.id, firstName: "Test", lastName: "User", emailId: user.emailId, password: user.password, loginType: .Apple)
        
        stub(mockFirestore) { mock in
            when(mock.updateUser(user: equal(to: newUser))).thenReturn(expectedResult)
        }

        viewModel = ProfileViewModel(pilot: pilot)
        viewModel.firstName = newUser.firstName
        viewModel.lastName = newUser.lastName
        viewModel.onSaveBtnClick()

        verify(mockFirestore).updateUser(user: equal(to: newUser))
        verify(mockPreference).user.set(equal(to: newUser))
    }
    
    func testOnSaveButtonClickFailed() {

        stub(mockPreference) { mock in
            when(mock.user).get.thenReturn(user)
        }
        
        let expectedResult = Fail<Void, Error>(error: ServiceError.serverError() as Error).eraseToAnyPublisher()
        let newUser = AppUser(id: user.id, firstName: "Test", lastName: "User", emailId: user.emailId, password: user.password, loginType: .Apple)
        
        stub(mockFirestore) { mock in
            when(mock.updateUser(user: equal(to: newUser))).thenReturn(expectedResult)
        }

        viewModel = ProfileViewModel(pilot: pilot)
        viewModel.firstName = newUser.firstName
        viewModel.lastName = newUser.lastName
        viewModel.onSaveBtnClick()

        verify(mockFirestore).updateUser(user: equal(to: newUser))
        XCTAssertTrue(viewModel.showAlert)
    }
}
