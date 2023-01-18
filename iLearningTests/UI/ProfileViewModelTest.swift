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

extension User: OptionalMatchable, Matchable {
    public var matcher: ParameterMatcher<User> {
        return ParameterMatcher { $0 == self }
    }
}


final class ProfileViewModelTest: XCTestCase {

    var viewModel: ProfileViewModel!
    var preferences: MockAppPreferences!
    var mockFirestore: MockFirestoreManager!
    
    let userWithAppleLogin = User(id: "XYZ", firstName: "Amisha", lastName: "Italiya", emailId: "amisha.i@canopas.com", password: "amisha_123", loginType: .Apple)
    
    let userWithEmailLogin: User? = User(id: "XYZ", firstName: "Amisha", lastName: "Italiya", emailId: "amisha.i@canopas.com", password: "amisha_123", loginType: .Email)

    let pilot: UIPilot<AppRoute> = UIPilot(initial: .Profile)

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
            when(mock.user.get).thenReturn(userWithAppleLogin)
        }
        
        viewModel = ProfileViewModel(pilot: pilot)
        
        XCTAssertEqual(viewModel.firstName, "Amisha")
        XCTAssertEqual(viewModel.lastName, "Italiya")
        XCTAssertEqual(viewModel.emailId, "amisha.i@canopas.com")
    }
    
    func testSetUserName() {
        stub(preferences) { mock in
            when(mock.user.get).thenReturn(userWithAppleLogin)
        }
        
        viewModel = ProfileViewModel(pilot: pilot)
        viewModel.setUserName()
        
        XCTAssertEqual(viewModel.firstName, "Amisha")
        XCTAssertEqual(viewModel.lastName, "Italiya")
        XCTAssertEqual(viewModel.emailId, "amisha.i@canopas.com")
    }
    
//    func testOnSaveButtonClick() {
//
//        stub(preferences) { mock in
//            when(mock.user).get.thenReturn(userWithAppleLogin)
//        }
//
//        let matcher = ParameterMatcher<User> {
//            $0.firstName == self.userWithAppleLogin.firstName
//        }
//
//        let callback = Callback<Void>.matching {
//            return true
//        }
//
////        stub(mockFirestore) { mock in
////            when(mock.updateUser(user: matcher, completion: userWithAppleLogin)).thenDoNothing()
////            mock.updateUser(user: equal(to: userWithAppleLogin), completion: equal(to: userWithAppleLogin))
////        }
//
////        stub(mockFirestore) { mock in
////            when(mock.updateUser(user: userWithAppleLogin, completion: {})).thenReturn(userWithAppleLogin)
////        }
//
//        viewModel = ProfileViewModel(pilot: pilot)
//
//        viewModel.onSaveBtnClick()
//
////        verify(preferences).user.set(userWithAppleLogin)
//
//        XCTAssertEqual(preferences.user, userWithAppleLogin)
//    }

//    func testOnSaveButtonClick() {
//
//        stub(preferences) { stub in
//            when(stub.userFirstName.get).thenReturn("Amisha")
//            when(stub.userLastName.get).thenReturn("Italiya")
//            when(stub.userEmailId.get).thenReturn("amisha@gmail.com")
//
//            when(stub.userEmailId.set(anyString())).thenDoNothing()
//            when(stub.userFirstName.set(anyString())).thenDoNothing()
//            when(stub.userLastName.set(anyString())).thenDoNothing()
//        }
//
//        viewModel = ProfileViewModel(pilot: pilot)
//
//        viewModel.firstName = "Amisha"
//        viewModel.lastName = "Italiya"
//        viewModel.emailId = "amisha@gmail.com"
//
//        viewModel.onSaveBtnClick()
//
//        verify(preferences).userFirstName.set("Amisha")
//        verify(preferences).userLastName.set("Italiya")
//        verify(preferences).userEmailId.set("amisha@gmail.com")
//
//// OR
////        XCTAssertEqual(viewModel.firstName, preferences.userFirstName)
////        XCTAssertEqual(viewModel.lastName, preferences.userLastName)
////        XCTAssertEqual(viewModel.emailId, preferences.userEmailId)
//
//        if let lastRoute = pilot.routes.last {
//            XCTAssertNotEqual(AppRoute.Profile, lastRoute)
//        }
//    }
}
