//
//  AuthHandler.swift
//  iLearning
//
//  Created by Amisha Italiya on 01/02/23.
//

import Foundation
import FirebaseAuth

public protocol AuthHandler {
    var currentUser: User? { get }

    func createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    func signIn(With email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    func signIn(with credential: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?)
    func signOut()
    func delete()
}

class AuthHandlerImpl: AuthHandler {

    let auth = FirebaseProvider.auth

    var currentUser: User? {
        get {
            auth.currentUser
        }
    }

    func createUser(email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?) {
        auth.createUser(withEmail: email, password: password, completion: { result, error in
            completion?(AuthHandlerResult(uid: result?.user.uid ?? ""), error)
        })
    }

    func signIn(With email: String, password: String, completion: ((AuthHandlerResult?, Error?) -> Void)?) {
        auth.signIn(withEmail: email, password: password, completion: { result, error in
            completion?(AuthHandlerResult(uid: result?.user.uid ?? ""), error)
        })
    }

    func signIn(with credential: AuthCredential, completion: ((AuthHandlerResult?, Error?) -> Void)?) {

    }

    func signOut() {
        try? auth.signOut()
    }

    func delete() {

    }
}

public struct AuthHandlerResult {
    let uid: String
}
