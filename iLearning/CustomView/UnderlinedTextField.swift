//
//  UnderlinedTextField.swift
//  iLearning
//
//  Created by Amisha Italiya on 14/12/22.
//

import SwiftUI

struct UnderlinedTextField: View {

    @Binding var fieldName: String
    @Binding var bindingValue: String

    var body: some View {
        VStack {
            TextField(fieldName, text: $bindingValue)

            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
        }
    }
}
