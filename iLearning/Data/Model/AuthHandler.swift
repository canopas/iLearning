//
//  AuthHandler.swift
//  iLearning
//
//  Created by Amisha Italiya on 01/02/23.
//

import Foundation
import FirebaseAuth

public protocol AuthHandler {
    func signOut()
    func delete()
}

class AuthHandlerImpl: AuthHandler {

    let auth = FirebaseProvider.auth

    func signOut() {
        try? auth.signOut()
    }

    func delete() {

    }
}
