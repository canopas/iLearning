//
//  UIView+Extension.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI

public extension View {
    func navigationBarIsHidden(_ hidden: Bool) -> some View {
        if #available(iOS 16.0, *) {
            return self
                .toolbar(hidden ? .hidden : .visible, for: .navigationBar)
        } else {
            return self
                .navigationBarHidden(hidden)
        }
    }
}
