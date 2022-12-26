//
//  FirestoreManager.swift
//  iLearning
// 
//  Created by Amisha Italiya on 22/12/22.
//

import Foundation
import FirebaseFirestore

protocol FirestoreManager {
    func createUserDatabase(user: User)
    func updateUserDatabase(user: User)
    func fetchUser()
}

class FirestoreManagerImpl: FirestoreManager, ObservableObject {

    @Published var restaurant: String = ""

    private let db = Firestore.firestore()

    func createUserDatabase(user: User) {
        let docRef = db.collection("Users").document("id")
        docRef.setData(["firstName": user.firstName,
                        "lastName": user.lastName,
                        "emailId": user.emailId,
                        "password": user.password,
                        "loginType": user.loginType.rawValue
                       ]) { error in
            if let error = error {
                print("XXX -- Error writing document: \(error).")
            } else {
                print("XXX -- Document successfully written!...")
            }
        }
    }

    func updateUserDatabase(user: User) {
        let docRef = db.collection("Users").document("id")
        docRef.updateData(["firstName": user.firstName,
                           "lastName": user.lastName,
                           "emailId": user.emailId,
                           "password": user.password,
                           "loginType": user.loginType.rawValue
                       ]) { error in
            if let error = error {
                print("XXX -- Error updating document: \(error).")
            } else {
                print("XXX -- Document successfully updated!...")
            }
        }
    }

    func fetchUser() {
        print("XXX -- Fetch User ...")
        let docRef = db.collection("Users").document("id")
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("XXX -- error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("XXX -- data", data)
//                    self.restaurant = data["name"] as? String ?? ""
                }
            }
        }
    }
}
