//
//  PrimaryButton.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI

public struct PrimaryButton: View {
    private let text: String
    private let isEnabled: Bool
    private let onClick: (() -> Void)?
    private let isEventEnabled: Bool

    private var color: Color {
        return isEnabled ? R.color.appMainColor.color : R.color.appMainColor.color.opacity(0.6)
    }

    public init(text: String, isEnabled: Bool = true, isEventEnabled: Bool? = nil, onClick: (() -> Void)? = nil) {
        self.text = text
        self.isEnabled = isEnabled
        if let isEventEnabled = isEventEnabled {
            self.isEventEnabled = isEventEnabled
        } else {
            self.isEventEnabled = isEnabled
        }
        self.onClick = onClick
    }

    public var body: some View {
        ZStack(alignment: .center) {
            Button(action: {
                if isEventEnabled {
                    onClick?()
                }
            }, label: {
                ZStack {
                    Text(text)
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 50)
                        .background(R.color.appMainColor.color)
                        .minimumScaleFactor(0.5)
                }
                .clipShape(Capsule())
            })
            .buttonStyle(.scale)
        }
    }
}

public struct SecondaryButton: View {
    private let text: String
    private let isEnabled: Bool = true
    private let onClick: (() -> Void)?

    private var color: Color {
        return isEnabled ? R.color.appMainColor.color : R.color.appMainColor.color.opacity(0.6)
    }

    public init(text: String, onClick: (() -> Void)?) {
        self.text = text
        self.onClick = onClick
    }

    public var body: some View {
        ZStack(alignment: .center) {
            Button {
                if isEnabled {
                    onClick?()
                }
            } label: {
                Text(text)
                    .bold()
                    .foregroundColor(color)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 50)
                    .clipShape(Capsule())
                    .background(Color.white.opacity(0.1))
                    .minimumScaleFactor(0.5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(color, lineWidth: 1)
                    )
            }
            .buttonStyle(.scale)
        }
    }
}
