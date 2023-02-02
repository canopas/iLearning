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

    func signOut() {
        try? auth.signOut()
    }

    func delete() {

    }
}
