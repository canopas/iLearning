// MARK: - Mocks generated from file: iLearning/Data/Language/LanguageManager.swift at 2023-02-03 06:56:30 +0000

//
//  LanguageManager.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import Cuckoo
@testable import iLearning

import SwiftUI
import UIKit






public class MockLanguageManager: LanguageManager, Cuckoo.ClassMock {
    
    public typealias MocksType = LanguageManager
    
    public typealias Stubbing = __StubbingProxy_LanguageManager
    public typealias Verification = __VerificationProxy_LanguageManager

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: LanguageManager?

    public func enableDefaultImplementation(_ stub: LanguageManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
    public override var currentLanguage: Languages {
        get {
            return cuckoo_manager.getter("currentLanguage",
                superclassCall:
                    
                    super.currentLanguage
                    ,
                defaultCall: __defaultImplStub!.currentLanguage)
        }
        
        set {
            cuckoo_manager.setter("currentLanguage",
                value: newValue,
                superclassCall:
                    
                    super.currentLanguage = newValue
                    ,
                defaultCall: __defaultImplStub!.currentLanguage = newValue)
        }
        
    }
    
    
    
    
    
    public override var defaultLanguage: Languages {
        get {
            return cuckoo_manager.getter("defaultLanguage",
                superclassCall:
                    
                    super.defaultLanguage
                    ,
                defaultCall: __defaultImplStub!.defaultLanguage)
        }
        
        set {
            cuckoo_manager.setter("defaultLanguage",
                value: newValue,
                superclassCall:
                    
                    super.defaultLanguage = newValue
                    ,
                defaultCall: __defaultImplStub!.defaultLanguage = newValue)
        }
        
    }
    
    
    
    
    
    public override var isRightToLeft: Bool {
        get {
            return cuckoo_manager.getter("isRightToLeft",
                superclassCall:
                    
                    super.isRightToLeft
                    ,
                defaultCall: __defaultImplStub!.isRightToLeft)
        }
        
    }
    
    
    
    
    
    public override var appLocale: Locale {
        get {
            return cuckoo_manager.getter("appLocale",
                superclassCall:
                    
                    super.appLocale
                    ,
                defaultCall: __defaultImplStub!.appLocale)
        }
        
    }
    
    
    
    
    
    public override var supportedLanguages: [Languages] {
        get {
            return cuckoo_manager.getter("supportedLanguages",
                superclassCall:
                    
                    super.supportedLanguages
                    ,
                defaultCall: __defaultImplStub!.supportedLanguages)
        }
        
    }
    
    

    

    
    
    
    
    public override func setLanguage(language: Languages)  {
        
    return cuckoo_manager.call(
    """
    setLanguage(language: Languages)
    """,
            parameters: (language),
            escapingParameters: (language),
            superclassCall:
                
                super.setLanguage(language: language)
                ,
            defaultCall: __defaultImplStub!.setLanguage(language: language))
        
    }
    
    

    public struct __StubbingProxy_LanguageManager: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        public init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var currentLanguage: Cuckoo.ClassToBeStubbedProperty<MockLanguageManager, Languages> {
            return .init(manager: cuckoo_manager, name: "currentLanguage")
        }
        
        
        
        
        var defaultLanguage: Cuckoo.ClassToBeStubbedProperty<MockLanguageManager, Languages> {
            return .init(manager: cuckoo_manager, name: "defaultLanguage")
        }
        
        
        
        
        var isRightToLeft: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockLanguageManager, Bool> {
            return .init(manager: cuckoo_manager, name: "isRightToLeft")
        }
        
        
        
        
        var appLocale: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockLanguageManager, Locale> {
            return .init(manager: cuckoo_manager, name: "appLocale")
        }
        
        
        
        
        var supportedLanguages: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockLanguageManager, [Languages]> {
            return .init(manager: cuckoo_manager, name: "supportedLanguages")
        }
        
        
        
        
        
        func setLanguage<M1: Cuckoo.Matchable>(language: M1) -> Cuckoo.ClassStubNoReturnFunction<(Languages)> where M1.MatchedType == Languages {
            let matchers: [Cuckoo.ParameterMatcher<(Languages)>] = [wrap(matchable: language) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockLanguageManager.self, method:
    """
    setLanguage(language: Languages)
    """, parameterMatchers: matchers))
        }
        
        
    }

    public struct __VerificationProxy_LanguageManager: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var currentLanguage: Cuckoo.VerifyProperty<Languages> {
            return .init(manager: cuckoo_manager, name: "currentLanguage", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var defaultLanguage: Cuckoo.VerifyProperty<Languages> {
            return .init(manager: cuckoo_manager, name: "defaultLanguage", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var isRightToLeft: Cuckoo.VerifyReadOnlyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "isRightToLeft", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var appLocale: Cuckoo.VerifyReadOnlyProperty<Locale> {
            return .init(manager: cuckoo_manager, name: "appLocale", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var supportedLanguages: Cuckoo.VerifyReadOnlyProperty<[Languages]> {
            return .init(manager: cuckoo_manager, name: "supportedLanguages", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func setLanguage<M1: Cuckoo.Matchable>(language: M1) -> Cuckoo.__DoNotUse<(Languages), Void> where M1.MatchedType == Languages {
            let matchers: [Cuckoo.ParameterMatcher<(Languages)>] = [wrap(matchable: language) { $0 }]
            return cuckoo_manager.verify(
    """
    setLanguage(language: Languages)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


public class LanguageManagerStub: LanguageManager {
    
    
    
    
    public override var currentLanguage: Languages {
        get {
            return DefaultValueRegistry.defaultValue(for: (Languages).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public override var defaultLanguage: Languages {
        get {
            return DefaultValueRegistry.defaultValue(for: (Languages).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public override var isRightToLeft: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
    }
    
    
    
    
    
    public override var appLocale: Locale {
        get {
            return DefaultValueRegistry.defaultValue(for: (Locale).self)
        }
        
    }
    
    
    
    
    
    public override var supportedLanguages: [Languages] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([Languages]).self)
        }
        
    }
    
    

    

    
    
    
    
    public override func setLanguage(language: Languages)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: iLearning/Data/Model/AuthHandler.swift at 2023-02-03 06:56:30 +0000

//
//  AuthHandler.swift
//  iLearning
//
//  Created by Amisha Italiya on 01/02/23.
//

import Cuckoo
@testable import iLearning

import FirebaseAuth
import Foundation






public class MockAuthHandler: AuthHandler, Cuckoo.ProtocolMock {
    
    public typealias MocksType = AuthHandler
    
    public typealias Stubbing = __StubbingProxy_AuthHandler
    public typealias Verification = __VerificationProxy_AuthHandler

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: AuthHandler?

    public func enableDefaultImplementation(_ stub: AuthHandler) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
    public var currentUser: User? {
        get {
            return cuckoo_manager.getter("currentUser",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.currentUser)
        }
        
    }
    
    

    

    
    
    
    
    public func createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)  {
        
    return cuckoo_manager.call(
    """
    createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.createUser(email: email, password: password, completion: completion))
        
    }
    
    
    
    
    
    public func signIn(With email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)  {
        
    return cuckoo_manager.call(
    """
    signIn(With: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.signIn(With: email, password: password, completion: completion))
        
    }
    
    
    
    
    
    public func signIn(with credential: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)  {
        
    return cuckoo_manager.call(
    """
    signIn(with: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """,
            parameters: (credential, completion),
            escapingParameters: (credential, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.signIn(with: credential, completion: completion))
        
    }
    
    
    
    
    
    public func signOut()  {
        
    return cuckoo_manager.call(
    """
    signOut()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.signOut())
        
    }
    
    
    
    
    
    public func delete()  {
        
    return cuckoo_manager.call(
    """
    delete()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.delete())
        
    }
    
    

    public struct __StubbingProxy_AuthHandler: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        public init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var currentUser: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockAuthHandler, User?> {
            return .init(manager: cuckoo_manager, name: "currentUser")
        }
        
        
        
        
        
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(email: M1, password: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandler.self, method:
    """
    createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(With email: M1, password: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandler.self, method:
    """
    signIn(With: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(with credential: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?)> where M1.MatchedType == AuthCredential, M2.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandler.self, method:
    """
    signIn(with: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signOut() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandler.self, method:
    """
    signOut()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func delete() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandler.self, method:
    """
    delete()
    """, parameterMatchers: matchers))
        }
        
        
    }

    public struct __VerificationProxy_AuthHandler: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var currentUser: Cuckoo.VerifyReadOnlyProperty<User?> {
            return .init(manager: cuckoo_manager, name: "currentUser", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, ((AuthHandlerResult?, Error?) -> Void)?), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(With email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, ((AuthHandlerResult?, Error?) -> Void)?), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    signIn(With: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(with credential: M1, completion: M2) -> Cuckoo.__DoNotUse<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?), Void> where M1.MatchedType == AuthCredential, M2.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    signIn(with: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signOut() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    signOut()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func delete() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    delete()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


public class AuthHandlerStub: AuthHandler {
    
    
    
    
    public var currentUser: User? {
        get {
            return DefaultValueRegistry.defaultValue(for: (User?).self)
        }
        
    }
    
    

    

    
    
    
    
    public func createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
    public func signIn(With email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
    public func signIn(with credential: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
    public func signOut()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
    public func delete()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}










 class MockAuthHandlerImpl: AuthHandlerImpl, Cuckoo.ClassMock {
    
     typealias MocksType = AuthHandlerImpl
    
     typealias Stubbing = __StubbingProxy_AuthHandlerImpl
     typealias Verification = __VerificationProxy_AuthHandlerImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: AuthHandlerImpl?

     func enableDefaultImplementation(_ stub: AuthHandlerImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    
     override var currentUser: User? {
        get {
            return cuckoo_manager.getter("currentUser",
                superclassCall:
                    
                    super.currentUser
                    ,
                defaultCall: __defaultImplStub!.currentUser)
        }
        
    }
    
    

    

    
    
    
    
     override func createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)  {
        
    return cuckoo_manager.call(
    """
    createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                super.createUser(email: email, password: password, completion: completion)
                ,
            defaultCall: __defaultImplStub!.createUser(email: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     override func signIn(With email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)  {
        
    return cuckoo_manager.call(
    """
    signIn(With: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """,
            parameters: (email, password, completion),
            escapingParameters: (email, password, completion),
            superclassCall:
                
                super.signIn(With: email, password: password, completion: completion)
                ,
            defaultCall: __defaultImplStub!.signIn(With: email, password: password, completion: completion))
        
    }
    
    
    
    
    
     override func signIn(with credential: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)  {
        
    return cuckoo_manager.call(
    """
    signIn(with: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """,
            parameters: (credential, completion),
            escapingParameters: (credential, completion),
            superclassCall:
                
                super.signIn(with: credential, completion: completion)
                ,
            defaultCall: __defaultImplStub!.signIn(with: credential, completion: completion))
        
    }
    
    
    
    
    
     override func signOut()  {
        
    return cuckoo_manager.call(
    """
    signOut()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.signOut()
                ,
            defaultCall: __defaultImplStub!.signOut())
        
    }
    
    
    
    
    
     override func delete()  {
        
    return cuckoo_manager.call(
    """
    delete()
    """,
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.delete()
                ,
            defaultCall: __defaultImplStub!.delete())
        
    }
    
    

     struct __StubbingProxy_AuthHandlerImpl: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        var currentUser: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockAuthHandlerImpl, User?> {
            return .init(manager: cuckoo_manager, name: "currentUser")
        }
        
        
        
        
        
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(email: M1, password: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandlerImpl.self, method:
    """
    createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(With email: M1, password: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandlerImpl.self, method:
    """
    signIn(With: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(with credential: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?)> where M1.MatchedType == AuthCredential, M2.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandlerImpl.self, method:
    """
    signIn(with: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func signOut() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandlerImpl.self, method:
    """
    signOut()
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func delete() -> Cuckoo.ClassStubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockAuthHandlerImpl.self, method:
    """
    delete()
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_AuthHandlerImpl: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
        
        
        var currentUser: Cuckoo.VerifyReadOnlyProperty<User?> {
            return .init(manager: cuckoo_manager, name: "currentUser", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
    
        
        
        
        @discardableResult
        func createUser<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, ((AuthHandlerResult?, Error?) -> Void)?), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable>(With email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<(String, String, ((AuthHandlerResult?, Error?) -> Void)?), Void> where M1.MatchedType == String, M2.MatchedType == String, M3.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify(
    """
    signIn(With: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signIn<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(with credential: M1, completion: M2) -> Cuckoo.__DoNotUse<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?), Void> where M1.MatchedType == AuthCredential, M2.OptionalMatchedType == ((AuthHandlerResult?, Error?) -> Void) {
            let matchers: [Cuckoo.ParameterMatcher<(AuthCredential, ((AuthHandlerResult?, Error?) -> Void)?)>] = [wrap(matchable: credential) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify(
    """
    signIn(with: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func signOut() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    signOut()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func delete() -> Cuckoo.__DoNotUse<(), Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    delete()
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class AuthHandlerImplStub: AuthHandlerImpl {
    
    
    
    
     override var currentUser: User? {
        get {
            return DefaultValueRegistry.defaultValue(for: (User?).self)
        }
        
    }
    
    

    

    
    
    
    
     override func createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func signIn(With email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func signIn(with credential: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func signOut()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
    
    
     override func delete()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}





// MARK: - Mocks generated from file: iLearning/Data/Model/FirestoreManager.swift at 2023-02-03 06:56:30 +0000

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
    

    

    

    
    
    
    
    public func addUser(user: AppUser) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    addUser(user: AppUser) -> AnyPublisher<Void, Error>
    """,
            parameters: (user),
            escapingParameters: (user),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.addUser(user: user))
        
    }
    
    
    
    
    
    public func updateUser(user: AppUser) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    updateUser(user: AppUser) -> AnyPublisher<Void, Error>
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
    
    
    
    
    
    public func fetchUsers() -> AnyPublisher<[AppUser], ServiceError> {
        
    return cuckoo_manager.call(
    """
    fetchUsers() -> AnyPublisher<[AppUser], ServiceError>
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
        
        
        
        
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ProtocolStubFunction<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    addUser(user: AppUser) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ProtocolStubFunction<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    updateUser(user: AppUser) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func deleteUser<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.ProtocolStubFunction<(String), AnyPublisher<Void, Error>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func fetchUsers() -> Cuckoo.ProtocolStubFunction<(), AnyPublisher<[AppUser], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManager.self, method:
    """
    fetchUsers() -> AnyPublisher<[AppUser], ServiceError>
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
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    addUser(user: AppUser) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    updateUser(user: AppUser) -> AnyPublisher<Void, Error>
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
        func fetchUsers() -> Cuckoo.__DoNotUse<(), AnyPublisher<[AppUser], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    fetchUsers() -> AnyPublisher<[AppUser], ServiceError>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


public class FirestoreManagerStub: FirestoreManager {
    

    

    
    
    
    
    public func addUser(user: AppUser) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
    public func updateUser(user: AppUser) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
    public func deleteUser(id: String) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
    public func fetchUsers() -> AnyPublisher<[AppUser], ServiceError>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[AppUser], ServiceError>).self)
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
    

    

    

    
    
    
    
     override func addUser(user: AppUser) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    addUser(user: AppUser) -> AnyPublisher<Void, Error>
    """,
            parameters: (user),
            escapingParameters: (user),
            superclassCall:
                
                super.addUser(user: user)
                ,
            defaultCall: __defaultImplStub!.addUser(user: user))
        
    }
    
    
    
    
    
     override func updateUser(user: AppUser) -> AnyPublisher<Void, Error> {
        
    return cuckoo_manager.call(
    """
    updateUser(user: AppUser) -> AnyPublisher<Void, Error>
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
    
    
    
    
    
     override func fetchUsers() -> AnyPublisher<[AppUser], ServiceError> {
        
    return cuckoo_manager.call(
    """
    fetchUsers() -> AnyPublisher<[AppUser], ServiceError>
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
        
        
        
        
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ClassStubFunction<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    addUser(user: AppUser) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.ClassStubFunction<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    updateUser(user: AppUser) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func deleteUser<M1: Cuckoo.Matchable>(id: M1) -> Cuckoo.ClassStubFunction<(String), AnyPublisher<Void, Error>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: id) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    deleteUser(id: String) -> AnyPublisher<Void, Error>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func fetchUsers() -> Cuckoo.ClassStubFunction<(), AnyPublisher<[AppUser], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockFirestoreManagerImpl.self, method:
    """
    fetchUsers() -> AnyPublisher<[AppUser], ServiceError>
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
        func addUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    addUser(user: AppUser) -> AnyPublisher<Void, Error>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func updateUser<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<(AppUser), AnyPublisher<Void, Error>> where M1.MatchedType == AppUser {
            let matchers: [Cuckoo.ParameterMatcher<(AppUser)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify(
    """
    updateUser(user: AppUser) -> AnyPublisher<Void, Error>
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
        func fetchUsers() -> Cuckoo.__DoNotUse<(), AnyPublisher<[AppUser], ServiceError>> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
    """
    fetchUsers() -> AnyPublisher<[AppUser], ServiceError>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}


 class FirestoreManagerImplStub: FirestoreManagerImpl {
    

    

    
    
    
    
     override func addUser(user: AppUser) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
     override func updateUser(user: AppUser) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
     override func deleteUser(id: String) -> AnyPublisher<Void, Error>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Void, Error>).self)
    }
    
    
    
    
    
     override func fetchUsers() -> AnyPublisher<[AppUser], ServiceError>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<[AppUser], ServiceError>).self)
    }
    
    
}





// MARK: - Mocks generated from file: iLearning/Data/Preference/AppPreference.swift at 2023-02-03 06:56:30 +0000

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
    
    
    
    
    
    public var user: AppUser? {
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
        
        
        
        
        var user: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockAppPreferences, AppUser> {
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
        
        
        
        
        var user: Cuckoo.VerifyOptionalProperty<AppUser> {
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
    
    
    
    
    
    public var user: AppUser? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppUser?).self)
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
    
    
    
    
    
     override var user: AppUser? {
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
        
        
        
        
        var user: Cuckoo.ClassToBeStubbedOptionalProperty<MockAppPreferencesImpl, AppUser> {
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
        
        
        
        
        var user: Cuckoo.VerifyOptionalProperty<AppUser> {
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
    
    
    
    
    
     override var user: AppUser? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppUser?).self)
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




