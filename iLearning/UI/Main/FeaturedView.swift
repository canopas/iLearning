//
//  FeaturedView.swift
//  iLearning
//
//  Created by Amisha Italiya on 13/12/22.
//

import SwiftUI

struct FeaturedView: View {

    @Inject var firestore: FirestoreManager

    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome!!!")
                .font(.title.bold())
            Text("All the best for your journey ✍🏻.")
                .font(.subheadline)
        }
        .onAppear {
            firestore.fetchUser()
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
