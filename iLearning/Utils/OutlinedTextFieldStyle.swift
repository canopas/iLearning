//
//  OutlinedTextFieldStyle.swift
//  iLearning
//
//  Created by Amisha Italiya on 12/12/22.
//

import SwiftUI

struct OutlinedTextFieldStyle: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 12)
            .padding(.horizontal, 17)
            .overlay {
                Capsule(style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 2)
            }
    }
}
