//
//  EmailLoginViewModelTest.swift
//  iLearningTests
//
//  Created by Amisha Italiya on 02/02/23.
//

import XCTest
import Cuckoo
import UIPilot
import Combine
import FirebaseAuth

@testable import iLearning

final class EmailLoginViewModelTest: XCTestCase {
    
    var viewModel: EmailLoginViewModel!
    
    var mockAuthHandler: MockAuthHandler!
    var mockPreference: MockAppPreferences!
    var mockFirestore: MockFirestoreManager!
    var mockLanguageManager: MockLanguageManager!
    
    let pilot: UIPilot<AppRoute> = UIPilot(initial: .EmailLogin(isForSignUp: true))
    
    let user = AppUser(id: "123", firstName: "Amisha", lastName: "Italiya", emailId: "amisha.i@canopas.com", password: "amisha_123", loginType: .Apple)

    override func setUpWithError() throws {
        Injector.shared.setTestAassembler(assemblies: [FakeAppAssembly()])
        
        viewModel = .init(pilot: pilot, isForSignUp: true)
        
        mockAuthHandler = appResolve(serviceType: AuthHandler.self) as? MockAuthHandler
        mockPreference = appResolve(serviceType: AppPreferences.self) as? MockAppPreferences
        mockFirestore = appResolve(serviceType: FirestoreManager.self) as? MockFirestoreManager
        mockLanguageManager = appResolve(serviceType: LanguageManager.self) as? MockLanguageManager
        
        stub(mockLanguageManager) { mock in
            when(mock.currentLanguage.get).thenReturn(.en)
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testOnSignInClickWithProperDetail() {
//        let email = "amisha@gmail.com"
//        let password = "1234567890"
//
//        viewModel.email = email
//        viewModel.password = password
//
//        viewModel.onSignInClick()
//
//        XCTAssertFalse(viewModel.showAlert)
//    }
    
    func testOnSignInClickWithoutProperDetail() {
        viewModel.email = "amisha.gmail.com"
        viewModel.password = "12345"
        
        viewModel.onSignInClick()
        
        XCTAssertTrue(viewModel.showAlert)
    }
    
    func testCreateUser() {
        let email = "amisha@gmail.com"
        let password = "1234567890"
        
        viewModel.email = email
        viewModel.password = password

        stub(mockAuthHandler) { mock in
            when(mock.createUser(email: equal(to: email), password: equal(to: password), completion: any())).then { email, password, completion in
                completion?(AuthHandlerResult(uid: "123"), nil) // We'll check for existing user
            }
        }
        
        let expectedResult = PassthroughSubject<[AppUser], ServiceError>()
        stub(mockFirestore) { mock in
            when(mock.fetchUsers()).thenReturn(expectedResult.eraseToAnyPublisher())
        }
        
        stub(mockPreference) { mock in
            when(mock.isVerifiedUser.get).thenReturn(false)
            when(mock.user.set(any())).thenDoNothing()
            when(mock.isVerifiedUser.set(any())).thenDoNothing()
        }
        
        viewModel.createUser()
        
        expectedResult.send([user])
        
        verify(mockPreference).user.set(equal(to: user))
        verify(mockPreference).isVerifiedUser.set(equal(to: true))
    }
    
    func testLoginUser() {
        let email = "amisha@gmail.com"
        let password = "1234567890"
        
        viewModel.email = email
        viewModel.password = password

        stub(mockAuthHandler) { mock in
            when(mock.signIn(With: equal(to: email), password: equal(to: password), completion: any())).then { email, password, completion in
                completion?(AuthHandlerResult(uid: "ABC"), nil) // We'll check for new user
            }
        }
        
        let resultForFetchUser = PassthroughSubject<[AppUser], ServiceError>()
        let resultForAddUser = PassthroughSubject<Void, Error>()
        
        let newUser = AppUser(id: "ABC", firstName: user.firstName, lastName: user.lastName, emailId: user.emailId, password: user.password, loginType: .Email)
        stub(mockFirestore) { mock in
            when(mock.fetchUsers()).thenReturn(resultForFetchUser.eraseToAnyPublisher())
            when(mock.addUser(user: equal(to: newUser))).thenReturn(resultForAddUser.eraseToAnyPublisher())
        }
        
        stub(mockPreference) { mock in
            when(mock.isVerifiedUser.get).thenReturn(false)
            when(mock.user.set(any())).thenDoNothing()
            when(mock.isVerifiedUser.set(any())).thenDoNothing()
        }
        
        viewModel.loginUser()
        
        resultForFetchUser.send([newUser])
        resultForAddUser.send(completion: .finished)
        
        verify(mockPreference).user.set(equal(to: newUser))
        verify(mockPreference).isVerifiedUser.set(equal(to: true))
    }
}
