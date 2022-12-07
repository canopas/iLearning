//
//  OnboardView.swift
//  iLearning
//
//  Created by Amisha Italiya on 07/12/22.
//

import SwiftUI

struct OnboardView: View {
    
    @ObservedObject var viewModel: OnboardViewModel
    
    let images: [String] = ["online-discussion", "online-course", "online-classroom"]
    
    var body: some View {
        VStack(spacing: 50) {
            PageScrollView(images: .constant(images))

            PrimaryButton(text: R.string.onboardView.get_start.localized(), onClick: viewModel.onStartButtonTap)
        }
        .padding(.horizontal, 30)
    }
}

struct PageScrollView: View {
    
    @Binding var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                KFAnimatedImage(resource: Bundle.main.url(forResource: image, withExtension: "gif"))
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8, alignment: .center)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
