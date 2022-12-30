// MARK: - Mocks generated from file: iLearning/Data/Preference/AppPreference.swift at 2022-12-22 10:31:26 +0000

//
//  AppPreference.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import Cuckoo
@testable import iLearning

import Foundation






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
    
    
    
    
    
    public var loginType: LoginType {
        get {
            return cuckoo_manager.getter("loginType",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loginType)
        }
        
        set {
            cuckoo_manager.setter("loginType",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loginType = newValue)
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
    
    
    
    
    
    public var userFirstName: String {
        get {
            return cuckoo_manager.getter("userFirstName",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.userFirstName)
        }
        
        set {
            cuckoo_manager.setter("userFirstName",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.userFirstName = newValue)
        }
        
    }
    
    
    
    
    
    public var userLastName: String {
        get {
            return cuckoo_manager.getter("userLastName",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.userLastName)
        }
        
        set {
            cuckoo_manager.setter("userLastName",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.userLastName = newValue)
        }
        
    }
    
    
    
    
    
    public var userEmailId: String {
        get {
            return cuckoo_manager.getter("userEmailId",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.userEmailId)
        }
        
        set {
            cuckoo_manager.setter("userEmailId",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.userEmailId = newValue)
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
        
        
        
        
        var loginType: Cuckoo.ProtocolToBeStubbedProperty<MockAppPreferences, LoginType> {
            return .init(manager: cuckoo_manager, name: "loginType")
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.ProtocolToBeStubbedProperty<MockAppPreferences, Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser")
        }
        
        
        
        
        var userFirstName: Cuckoo.ProtocolToBeStubbedProperty<MockAppPreferences, String> {
            return .init(manager: cuckoo_manager, name: "userFirstName")
        }
        
        
        
        
        var userLastName: Cuckoo.ProtocolToBeStubbedProperty<MockAppPreferences, String> {
            return .init(manager: cuckoo_manager, name: "userLastName")
        }
        
        
        
        
        var userEmailId: Cuckoo.ProtocolToBeStubbedProperty<MockAppPreferences, String> {
            return .init(manager: cuckoo_manager, name: "userEmailId")
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
        
        
        
        
        var loginType: Cuckoo.VerifyProperty<LoginType> {
            return .init(manager: cuckoo_manager, name: "loginType", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.VerifyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var userFirstName: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "userFirstName", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var userLastName: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "userLastName", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var userEmailId: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "userEmailId", callMatcher: callMatcher, sourceLocation: sourceLocation)
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
    
    
    
    
    
    public var loginType: LoginType {
        get {
            return DefaultValueRegistry.defaultValue(for: (LoginType).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public var isVerifiedUser: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public var userFirstName: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public var userLastName: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
    
    
    
    public var userEmailId: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
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
    
    
    
    
    
     override var loginType: LoginType {
        get {
            return cuckoo_manager.getter("loginType",
                superclassCall:
                    
                    super.loginType
                    ,
                defaultCall: __defaultImplStub!.loginType)
        }
        
        set {
            cuckoo_manager.setter("loginType",
                value: newValue,
                superclassCall:
                    
                    super.loginType = newValue
                    ,
                defaultCall: __defaultImplStub!.loginType = newValue)
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
    
    
    
    
    
     override var userFirstName: String {
        get {
            return cuckoo_manager.getter("userFirstName",
                superclassCall:
                    
                    super.userFirstName
                    ,
                defaultCall: __defaultImplStub!.userFirstName)
        }
        
        set {
            cuckoo_manager.setter("userFirstName",
                value: newValue,
                superclassCall:
                    
                    super.userFirstName = newValue
                    ,
                defaultCall: __defaultImplStub!.userFirstName = newValue)
        }
        
    }
    
    
    
    
    
     override var userLastName: String {
        get {
            return cuckoo_manager.getter("userLastName",
                superclassCall:
                    
                    super.userLastName
                    ,
                defaultCall: __defaultImplStub!.userLastName)
        }
        
        set {
            cuckoo_manager.setter("userLastName",
                value: newValue,
                superclassCall:
                    
                    super.userLastName = newValue
                    ,
                defaultCall: __defaultImplStub!.userLastName = newValue)
        }
        
    }
    
    
    
    
    
     override var userEmailId: String {
        get {
            return cuckoo_manager.getter("userEmailId",
                superclassCall:
                    
                    super.userEmailId
                    ,
                defaultCall: __defaultImplStub!.userEmailId)
        }
        
        set {
            cuckoo_manager.setter("userEmailId",
                value: newValue,
                superclassCall:
                    
                    super.userEmailId = newValue
                    ,
                defaultCall: __defaultImplStub!.userEmailId = newValue)
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
        
        
        
        
        var loginType: Cuckoo.ClassToBeStubbedProperty<MockAppPreferencesImpl, LoginType> {
            return .init(manager: cuckoo_manager, name: "loginType")
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.ClassToBeStubbedProperty<MockAppPreferencesImpl, Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser")
        }
        
        
        
        
        var userFirstName: Cuckoo.ClassToBeStubbedProperty<MockAppPreferencesImpl, String> {
            return .init(manager: cuckoo_manager, name: "userFirstName")
        }
        
        
        
        
        var userLastName: Cuckoo.ClassToBeStubbedProperty<MockAppPreferencesImpl, String> {
            return .init(manager: cuckoo_manager, name: "userLastName")
        }
        
        
        
        
        var userEmailId: Cuckoo.ClassToBeStubbedProperty<MockAppPreferencesImpl, String> {
            return .init(manager: cuckoo_manager, name: "userEmailId")
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
        
        
        
        
        var loginType: Cuckoo.VerifyProperty<LoginType> {
            return .init(manager: cuckoo_manager, name: "loginType", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var isVerifiedUser: Cuckoo.VerifyProperty<Bool> {
            return .init(manager: cuckoo_manager, name: "isVerifiedUser", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var userFirstName: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "userFirstName", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var userLastName: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "userLastName", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        
        
        
        var userEmailId: Cuckoo.VerifyProperty<String> {
            return .init(manager: cuckoo_manager, name: "userEmailId", callMatcher: callMatcher, sourceLocation: sourceLocation)
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
    
    
    
    
    
     override var loginType: LoginType {
        get {
            return DefaultValueRegistry.defaultValue(for: (LoginType).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var isVerifiedUser: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var userFirstName: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var userLastName: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
    
    
    
     override var userEmailId: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    

    

    
    
    
    
     override func clearPreference()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
}




