//
//  AccountViewModelTest.swift
//  iLearningTests
//
//  Created by Amisha Italiya on 19/01/23.
//

import XCTest
import UIPilot
import Cuckoo
import Combine
@testable import iLearning

final class AccountViewModelTest: XCTestCase {
    
    var viewModel: AccountViewModel!
    var mockPreferences: MockAppPreferences!
    var mockFirestore: MockFirestoreManager!
    
    let pilot: UIPilot<AppRoute> = UIPilot(initial: .Home)
    
    let user = User(id: "123", firstName: "Amisha", lastName: "Italiya", emailId: "amisha.i@canopas.com", password: "amisha_123", loginType: .Apple)

    override func setUpWithError() throws {
        viewModel = AccountViewModel(pilot: pilot)
        Injector.shared.setTestAassembler(assemblies: [FakeAppAssembly()])
        mockPreferences = appResolve(serviceType: AppPreferences.self) as? MockAppPreferences
        mockFirestore = appResolve(serviceType: FirestoreManager.self) as? MockFirestoreManager
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetUserDetails() {
        stub(mockPreferences) { mock in
            when(mock.user.get).thenReturn(user)
        }
        
        viewModel = AccountViewModel(pilot: pilot)
        viewModel.getUserDetails()
        
        XCTAssertEqual(viewModel.userName, user.firstName + " " + user.lastName)
        XCTAssertEqual(viewModel.imageText, String(user.firstName.prefix(1) + user.lastName.prefix(1)))
    }
    
    func testOpenProfileScreen() {
        viewModel.openProfileScreen()
        
        if let lastRoute = pilot.routes.last {
            XCTAssertEqual(AppRoute.Profile, lastRoute)
        }
    }
    
    func testDeleteAction() {
        viewModel.handleDeleteAction()
        XCTAssertEqual(R.string.commonStrings.warning_text.localized(), viewModel.alert.title)
        XCTAssertEqual(R.string.commonStrings.delete_alert_text.localized(), viewModel.alert.message)
        XCTAssertTrue(viewModel.showAlert)
    }
    
    func testDeleteAccountSuccess() {
        
        stub(mockPreferences) { mock in
            when(mock.user.get).thenReturn(user)
            when(mock.user).set(any()).thenDoNothing()
            when(mock.isVerifiedUser.get).thenReturn(true)
            when(mock.isVerifiedUser).set(any()).thenDoNothing()
        }
        
        let expectedResult = PassthroughSubject<Void, Error>()
        
        stub(mockFirestore) { mock in
            when(mock.deleteUser(id: equal(to: user.id))).thenReturn(expectedResult.eraseToAnyPublisher())
        }
        
        viewModel.deleteUserAccount()
        expectedResult.send(completion: .finished)
        XCTAssertEqual(mockPreferences.isVerifiedUser, false)
        XCTAssertEqual(mockPreferences.user, nil)
//        verify(mockPreferences).clearPreference()
//        verify(mockPreferences).isVerifiedUser.set(equal(to: false))
//        verify(mockPreferences).user.set(equal(to: nil))
    }
}
