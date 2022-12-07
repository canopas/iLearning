//
//  Color+Extension.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import Rswift
import SwiftUI

public extension ColorResource {
    var color: Color {
        Color(self.name, bundle: self.bundle)
    }
}
