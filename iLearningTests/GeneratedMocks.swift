// MARK: - Mocks generated from file: iLearning/Data/Model/FirestoreManager.swift at 2023-01-18 13:30:34 +0000

//
//  FirestoreManager.swift
//  iLearning
// 
//  Created by Amisha Italiya on 22/12/22.
//

import Cuckoo
@testable import iLearning

import Combine
import FirebaseFirestore
import Foundation






public class MockFirestoreManager: FirestoreManager, Cuckoo.ProtocolMock {
    
    public typealias MocksType = FirestoreManager
    
    public typealias Stubbing = __StubbingProxy_FirestoreManager
    public typealias Verification = __VerificationProxy_FirestoreManager

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FirestoreManager?

    public func enableDefaultImplementation(_ stub: FirestoreManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
    public func addUser(user: User) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    addUser(user: User) -> AnyPublisher<Void, Error>
    """,
            parameters: (user),
            escapingParameters: (user),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.addUser(user: user))
        
    }
    
    
    
    
    
    public func updateUser(user: User) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    updateUser(user: User) -> AnyPublisher<Void, Error>
    """,
            parameters: (user),
            escapingParameters: (user),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.updateUser(user: user))
        
    }
    
    
    
    
    
    public func deleteUser(id: String) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """,
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.deleteUser(id: id))
        
    }
    
    
    
    
    
    public func fetchUsers() -> AnyPublisher<[User], ServiceError> {
        
    return cuckoo_manager.call(
    """
    fetchUsers() -> AnyPublisher<[User], ServiceError>
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchUsers())
        
    }
    
    

    public struct __StubbingProxy_FirestoreManager: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        public init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ProtocolStubFunction<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    addUser(user: User) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ProtocolStubFunction<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    updateUser(user: User) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func deleteUser<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.ProtocolStubFunction<(String), AnyPublisher<Void, Error>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func fetchUsers() -> Cuckoo.ProtocolStubFunction<(), AnyPublisher<[User], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    fetchUsers() -> AnyPublisher<[User], ServiceError>
    """, parameterMatchers: matchers))
        }
        
        
    }

    public struct __VerificationProxy_FirestoreManager: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    addUser(user: User) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    updateUser(user: User) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func deleteUser<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.__DoNotUse<(String), AnyPublisher<Void, Error>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify(
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func fetchUsers() -> Cuckoo.__DoNotUse<(), AnyPublisher<[User], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    fetchUsers() -> AnyPublisher<[User], ServiceError>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


public class FirestoreManagerStub: FirestoreManager {
    

    

    
    
    
    
    public func addUser(user: User) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
    public func updateUser(user: User) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
    public func deleteUser(id: String) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
    public func fetchUsers() -> AnyPublisher<[User], ServiceError>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[User], ServiceError>).self)
    }
    
    
}










 class MockFirestoreManagerImpl: FirestoreManagerImpl, Cuckoo.ClassMock {
    
     typealias MocksType = FirestoreManagerImpl
    
     typealias Stubbing = __StubbingProxy_FirestoreManagerImpl
     typealias Verification = __VerificationProxy_FirestoreManagerImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: FirestoreManagerImpl?

     func enableDefaultImplementation(_ stub: FirestoreManagerImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     override func addUser(user: User) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    addUser(user: User) -> AnyPublisher<Void, Error>
    """,
            parameters: (user),
            escapingParameters: (user),
            superclassCall:
                
                super.addUser(user: user)
                ,
            defaultCall: __defaultImplStub!.addUser(user: user))
        
    }
    
    
    
    
    
     override func updateUser(user: User) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    updateUser(user: User) -> AnyPublisher<Void, Error>
    """,
            parameters: (user),
            escapingParameters: (user),
            superclassCall:
                
                super.updateUser(user: user)
                ,
            defaultCall: __defaultImplStub!.updateUser(user: user))
        
    }
    
    
    
    
    
     override func deleteUser(id: String) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """,
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                super.deleteUser(id: id)
                ,
            defaultCall: __defaultImplStub!.deleteUser(id: id))
        
    }
    
    
    
    
    
     override func fetchUsers() -> AnyPublisher<[User], ServiceError> {
        
    return cuckoo_manager.call(
    """
    fetchUsers() -> AnyPublisher<[User], ServiceError>
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.fetchUsers()
                ,
            defaultCall: __defaultImplStub!.fetchUsers())
        
    }
    
    

     struct __StubbingProxy_FirestoreManagerImpl: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ClassStubFunction<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    addUser(user: User) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ClassStubFunction<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    updateUser(user: User) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func deleteUser<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.ClassStubFunction<(String), AnyPublisher<Void, Error>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func fetchUsers() -> Cuckoo.ClassStubFunction<(), AnyPublisher<[User], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    fetchUsers() -> AnyPublisher<[User], ServiceError>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_FirestoreManagerImpl: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    addUser(user: User) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(User), AnyPublisher<Void, Error>> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    updateUser(user: User) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func deleteUser<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.__DoNotUse<(String), AnyPublisher<Void, Error>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return cuckoo_manager.verify(
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func fetchUsers() -> Cuckoo.__DoNotUse<(), AnyPublisher<[User], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    fetchUsers() -> AnyPublisher<[User], ServiceError>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class FirestoreManagerImplStub: FirestoreManagerImpl {
    

    

    
    
    
    
     override func addUser(user: User) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
     override func updateUser(user: User) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
     override func deleteUser(id: String) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
     override func fetchUsers() -> AnyPublisher<[User], ServiceError>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[User], ServiceError>).self)
    }
    
    
}





// MARK: - Mocks generated from file: iLearning/Data/Preference/AppPreference.swift at 2023-01-18 13:30:34 +0000

//
//  AppPreference.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import Cuckoo
@testable import iLearning

import SwiftUI
import UIKit






public class MockAppPreferences: AppPreferences, Cuckoo.ProtocolMock {
    
    public typealias MocksType = AppPreferences
    
    public typealias Stubbing = __StubbingProxy_AppPreferences
    public typealias Verification = __VerificationProxy_AppPreferences

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: AppPreferences?

    public func enableDefaultImplementation(_ stub: AppPreferences) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
    public var isOnboardShown: Bool {
        get {
            return cuckoo_manager.getter("isOnboardShown",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isOnboardShown)
        }
        
        set {
            cuckoo_manager.setter("isOnboardShown",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isOnboardShown = newValue)
        }
        
    }
    
    
    
    
    
    public var isVerifiedUser: Bool {
        get {
            return cuckoo_manager.getter("isVerifiedUser",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isVerifiedUser)
        }
        
        set {
            cuckoo_manager.setter("isVerifiedUser",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isVerifiedUser = newValue)
        }
        
    }
    
    
    
    
    
    public var user: User? {
        get {
            return cuckoo_manager.getter("user",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.user)
        }
        
        set {
            cuckoo_manager.setter("user",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.user = newValue)
        }
        
    }
    
    

    

    
    
    
    
    public func clearPreference()  {
        
    return cuckoo_manager.call(
    """
    clearPreference()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.clearPreference())
        
    }
    
    

    public struct __StubbingProxy_AppPreferences: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        public init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var isOnboardShown: Cuckoo.ProtocolToBeStubbedProperty<MockAppPreferences, Bool> {
            return .init(manager: cuckoo_manager, name: "isOnboardShown")
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.ProtocolToBeStubbedProperty<MockAppPreferences, Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser")
        }
        
        
        
        
        var user: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockAppPreferences, User> {
            return .init(manager: cuckoo_manager, name: "user")
        }
        
        
        
        
        
        func clearPreference() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockAppPreferences.self, method:
    """
    clearPreference()
    """, parameterMatchers: matchers))
        }
        
        
    }

    public struct __VerificationProxy_AppPreferences: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var isOnboardShown: Cuckoo.VerifyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "isOnboardShown", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.VerifyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var user: Cuckoo.VerifyOptionalProperty<User> {
            return .init(manager: cuckoo_manager, name: "user", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func clearPreference() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    clearPreference()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


public class AppPreferencesStub: AppPreferences {
    
    
    
    
    public var isOnboardShown: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public var isVerifiedUser: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public var user: User? {
        get {
            return DefaultValueRegistry.defaultValue(for: (User?).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
    public func clearPreference()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockAppPreferencesImpl: AppPreferencesImpl, Cuckoo.ClassMock {
    
     typealias MocksType = AppPreferencesImpl
    
     typealias Stubbing = __StubbingProxy_AppPreferencesImpl
     typealias Verification = __VerificationProxy_AppPreferencesImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: AppPreferencesImpl?

     func enableDefaultImplementation(_ stub: AppPreferencesImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var isOnboardShown: Bool {
        get {
            return cuckoo_manager.getter("isOnboardShown",
                superclassCall:
                    
                    super.isOnboardShown
                    ,
                defaultCall: __defaultImplStub!.isOnboardShown)
        }
        
        set {
            cuckoo_manager.setter("isOnboardShown",
                value: newValue,
                superclassCall:
                    
                    super.isOnboardShown = newValue
                    ,
                defaultCall: __defaultImplStub!.isOnboardShown = newValue)
        }
        
    }
    
    
    
    
    
     override var user: User? {
        get {
            return cuckoo_manager.getter("user",
                superclassCall:
                    
                    super.user
                    ,
                defaultCall: __defaultImplStub!.user)
        }
        
        set {
            cuckoo_manager.setter("user",
                value: newValue,
                superclassCall:
                    
                    super.user = newValue
                    ,
                defaultCall: __defaultImplStub!.user = newValue)
        }
        
    }
    
    
    
    
    
     override var isVerifiedUser: Bool {
        get {
            return cuckoo_manager.getter("isVerifiedUser",
                superclassCall:
                    
                    super.isVerifiedUser
                    ,
                defaultCall: __defaultImplStub!.isVerifiedUser)
        }
        
        set {
            cuckoo_manager.setter("isVerifiedUser",
                value: newValue,
                superclassCall:
                    
                    super.isVerifiedUser = newValue
                    ,
                defaultCall: __defaultImplStub!.isVerifiedUser = newValue)
        }
        
    }
    
    

    

    
    
    
    
     override func clearPreference()  {
        
    return cuckoo_manager.call(
    """
    clearPreference()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.clearPreference()
                ,
            defaultCall: __defaultImplStub!.clearPreference())
        
    }
    
    

     struct __StubbingProxy_AppPreferencesImpl: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var isOnboardShown: Cuckoo.ClassToBeStubbedProperty<MockAppPreferencesImpl, Bool> {
            return .init(manager: cuckoo_manager, name: "isOnboardShown")
        }
        
        
        
        
        var user: Cuckoo.ClassToBeStubbedOptionalProperty<MockAppPreferencesImpl, User> {
            return .init(manager: cuckoo_manager, name: "user")
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.ClassToBeStubbedProperty<MockAppPreferencesImpl, Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser")
        }
        
        
        
        
        
        func clearPreference() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockAppPreferencesImpl.self, method:
    """
    clearPreference()
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_AppPreferencesImpl: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var isOnboardShown: Cuckoo.VerifyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "isOnboardShown", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var user: Cuckoo.VerifyOptionalProperty<User> {
            return .init(manager: cuckoo_manager, name: "user", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.VerifyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func clearPreference() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    clearPreference()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class AppPreferencesImplStub: AppPreferencesImpl {
    
    
    
    
     override var isOnboardShown: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var user: User? {
        get {
            return DefaultValueRegistry.defaultValue(for: (User?).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var isVerifiedUser: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func clearPreference()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




