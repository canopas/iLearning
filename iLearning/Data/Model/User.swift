//
//  User.swift
//  iLearning
//
//  Created by Amisha Italiya on 21/12/22.
//

import SwiftUI

struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let emailId: String
    let loginType: LoginType

    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case emailId
        case loginType
    }
}
