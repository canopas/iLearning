//
//  FeaturedView.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import SwiftUI

struct FeaturedView: View {

    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome!!!")
                .font(.title.bold())
            Text("All the best for your journey ✍🏻.")
                .font(.subheadline)
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
