//
//  OnBoardView.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import SwiftUI

struct OnBoardView: View {
    
    let url = Bundle.main.url(forResource: "online-discussion", withExtension: "gif")
    
    var body: some View {
        VStack {
            KFAnimatedImage(resource: url)
                .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7, alignment: .center)
            VSpacer(60)

            PrimaryButton(text: R.string.onboardView.get_start.localized())
        }
        .padding(20)
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
