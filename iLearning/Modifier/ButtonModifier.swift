//
//  ButtonModifier.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI

private struct ButtonStyleTapGestureModifier: ViewModifier {

    let action: () -> Void

    public func body(content: Content) -> some View {
        Button(action: action) {
            content
                .contentShape(Rectangle())
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

public struct ScaleButtonStyle: ButtonStyle {
   public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }
}

public extension ButtonStyle where Self == ScaleButtonStyle {
    static var scale: Self {
        return .init()
    }
}

public extension View {
    func onTouchGesture(_ action: @escaping () -> Void) -> some View {
        self.modifier(ButtonStyleTapGestureModifier(action: action))
    }
}
