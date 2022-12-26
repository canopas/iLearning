//
//  User.swift
//  iLearning
//
//  Created by Amisha Italiya on 21/12/22.
//

import SwiftUI

struct User: Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let emailId: String
    let password: String
    let loginType: LoginType

    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case emailId
        case password
        case loginType
    }
}

public enum LoginType: String {
    case Apple
    case Email
    case None
}
