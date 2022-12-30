//
//  FirebaseProvider.swift
//  iLearning
//
//  Created by Amisha Italiya on 29/12/22.
//

import Foundation
import FirebaseAuth
import FirebaseCore

class FirebaseProvider {

    static let auth: Auth = .auth()

    static func configureFirebase() {
        FirebaseApp.configure()
    }
}
