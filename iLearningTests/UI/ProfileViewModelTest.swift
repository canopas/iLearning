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
    var preferences: MockAppPreferences!
    var mockFirestore: MockFirestoreManager!

    let pilot: UIPilot<AppRoute> = UIPilot(initial: .Profile)
    
    let user = User(id: "123", firstName: "Amisha", lastName: "Italiya", emailId: "amisha.i@canopas.com", password: "amisha_123", loginType: .Apple)

    override func setUpWithError() throws {
        Injector.shared.setTestAassembler(assemblies: [FakeAppAssembly()])
        preferences = appResolve(serviceType: AppPreferences.self) as? MockAppPreferences
        mockFirestore = appResolve(serviceType: FirestoreManager.self) as? MockFirestoreManager
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelInitialization() {

        stub(preferences) { mock in
            when(mock.user.get).thenReturn(user)
        }
        
        viewModel = ProfileViewModel(pilot: pilot)
        
        XCTAssertEqual(viewModel.firstName, "Amisha")
        XCTAssertEqual(viewModel.lastName, "Italiya")
        XCTAssertEqual(viewModel.emailId, "amisha.i@canopas.com")
    }
    
    func testSetUserName() {
        stub(preferences) { mock in
            when(mock.user.get).thenReturn(user)
        }
        
        viewModel = ProfileViewModel(pilot: pilot)
        viewModel.setUserName()
        
        XCTAssertEqual(viewModel.firstName, "Amisha")
        XCTAssertEqual(viewModel.lastName, "Italiya")
        XCTAssertEqual(viewModel.emailId, "amisha.i@canopas.com")
    }
    
    func testOnSaveButtonClickSuccess() {
        
        stub(preferences) { mock in
            when(mock.user).get.thenReturn(user)
            when(mock.user).set(any()).thenDoNothing()
        }
        
        let expectedResult = PassthroughSubject<Void, Error>()
        let newUser = User(id: user.id, firstName: "Test", lastName: "User", emailId: user.emailId, password: user.password, loginType: .Apple)
        
        stub(mockFirestore) { mock in
            when(mock.updateUser(user: equal(to: newUser))).thenReturn(expectedResult.eraseToAnyPublisher())
        }

        viewModel = ProfileViewModel(pilot: pilot)
        viewModel.firstName = newUser.firstName
        viewModel.lastName = newUser.lastName
        viewModel.onSaveBtnClick()

        expectedResult.send(completion: .finished)
        verify(mockFirestore).updateUser(user: equal(to: newUser))
        verify(preferences).user.set(equal(to: newUser))
    }
    
    func testOnSaveButtonClickFailed() {

        stub(preferences) { mock in
            when(mock.user).get.thenReturn(user)
        }
        
        let expectedResult = PassthroughSubject<Void, Error>()
        let newUser = User(id: user.id, firstName: "Test", lastName: "User", emailId: user.emailId, password: user.password, loginType: .Apple)
        
        stub(mockFirestore) { mock in
            when(mock.updateUser(user: equal(to: newUser))).thenReturn(expectedResult.eraseToAnyPublisher())
        }

        viewModel = ProfileViewModel(pilot: pilot)
        viewModel.firstName = newUser.firstName
        viewModel.lastName = newUser.lastName
        viewModel.onSaveBtnClick()
        
        expectedResult.send(completion: .failure(ServiceError.serverError() as Error))
        verify(mockFirestore).updateUser(user: equal(to: newUser))
        XCTAssertTrue(viewModel.showAlert)
    }
}
