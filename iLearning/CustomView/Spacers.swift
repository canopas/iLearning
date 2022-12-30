//
//  Spacers.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI

public struct HSpacer: View {
    private let width: CGFloat?

    public init(_ width: CGFloat? = nil) {
        self.width = width
    }

    public var body: some View {
        Spacer()
            .frame(width: width)
    }
}

public struct VSpacer: View {
    private let height: CGFloat?

    public init(_ height: CGFloat? = nil) {
        self.height = height
    }

    public var body: some View {
        Spacer()
            .frame(height: height)
    }
}
