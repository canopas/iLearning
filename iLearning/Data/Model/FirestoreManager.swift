//
//  FirestoreManager.swift
//  iLearning
// 
//  Created by Amisha Italiya on 22/12/22.
//

import Combine
import Foundation
import FirebaseFirestore

protocol FirestoreManager {
    func createUserDatabase(user: User, completion: @escaping () -> Void)
    func updateUserDatabase(user: User, completion: @escaping () -> Void)
    func fetchUsers() -> AnyPublisher<[User], ServiceError>
}

class FirestoreManagerImpl: FirestoreManager, ObservableObject {

    private let DATABASE_NAME: String = "Users"

    private let db = Firestore.firestore()

    func createUserDatabase(user: User, completion: @escaping () -> Void) {
        let docRef = db.collection(DATABASE_NAME).document("id")
        docRef.setData(["id": user.id,
                        "firstName": user.firstName,
                        "lastName": user.lastName,
                        "emailId": user.emailId,
                        "password": user.password,
                        "loginType": user.loginType.rawValue
                       ]) { error in
            if let error {
                LogE("FirestoreManager:: \(#function) : Error writing document: \(error).")
            } else {
                completion()
                LogD("FirestoreManager:: \(#function) : Document written successfully!")
            }
        }
    }

    func updateUserDatabase(user: User, completion: @escaping () -> Void) {
        let docRef = db.collection(DATABASE_NAME).document("id")
        docRef.updateData(["id": user.id,
                           "firstName": user.firstName,
                           "lastName": user.lastName,
                           "emailId": user.emailId,
                           "password": user.password,
                           "loginType": user.loginType.rawValue
                       ]) { error in
            if let error {
                LogE("FirestoreManager:: \(#function) : Error updating document: \(error).")
            } else {
                LogD("FirestoreManager:: \(#function) : Document updated successfully!")
            }
        }
    }

    func fetchUsers() -> AnyPublisher<[User], ServiceError> {
        var users: [User] = []

        return Future { [weak self] promise in
            guard let self = self else { return }
            self.db.collection(self.DATABASE_NAME)
                .getDocuments { (snapshot, error) in
                    guard error == nil else {
                        LogE("FirestoreManager:: \(#function) error: \(String(describing: error))")
                        return
                    }
                    if let snapshot {
                        for document in snapshot.documents {
                            do {
                                let data = try JSONSerialization.data(withJSONObject: document.data(), options: .prettyPrinted)
                                let res = try JSONDecoder().decode(User.self, from: data)
                                users.append(res)
                            } catch let error {
                                LogE("FirestoreManager:: \(#function) Decode error :: \(error.localizedDescription)")
                                promise(.failure(.serverError()))
                            }
                        }
                    } else {
                        LogE("FirestoreManager:: \(#function) The document is not available.")
                    }
                    promise(.success(users))
                }
        }
        .eraseToAnyPublisher()
    }
}
