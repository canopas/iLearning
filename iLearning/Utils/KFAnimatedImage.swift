//
//  KFAnimatedImage.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI
import Foundation
import Kingfisher

struct KFAnimatedImage: UIViewRepresentable {
    
    var resource: Resource?

    func makeUIView(context: Context) -> AnimatedImageView {
        return AnimatedImageView()
    }
    
    func updateUIView(_ uiView: AnimatedImageView, context: Context) {
        uiView.kf.setImage(with: resource, options: [
            .scaleFactor(UIScreen.main.scale),
            .cacheOriginalImage
        ])
    }
}
