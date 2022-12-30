//
//  User.swift
//  iLearning
//
//  Created by Amisha Italiya on 21/12/22.
//

import SwiftUI

public struct User: Codable {
    let id: String
    var firstName: String
    var lastName: String
    var emailId: String
    let password: String
    let loginType: LoginType
}

public enum LoginType: String, Codable {
    case Apple
    case Email
    case None
}
