//
//  FirestoreManager.swift
//  iLearning
// 
//  Created by Amisha Italiya on 22/12/22.
//

import Combine
import Foundation
import FirebaseFirestore

public protocol FirestoreManager {
    func addUser(user: AppUser) -> AnyPublisher<Void, Error>
    func updateUser(user: AppUser) -> AnyPublisher<Void, Error>
    func deleteUser(id: String) -> AnyPublisher<Void, Error>
    func fetchUsers() -> AnyPublisher<[AppUser], ServiceError>
}

class FirestoreManagerImpl: FirestoreManager, ObservableObject {

    private let DATABASE_NAME: String = "Users"

    private let db = Firestore.firestore()

    func addUser(user: AppUser) -> AnyPublisher<Void, Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            guard let data = try? JSONEncoder().encode(user) else { return }
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }

            self.db.collection(self.DATABASE_NAME).document(user.id)
                .setData(json) { error in
                    if let error {
                        print("FirestoreManager :: \(#function) : Writing document failed with error: \(error.localizedDescription).")
                        promise(.failure(error))
                    } else {
                        print("FirestoreManager :: \(#function) : Document written successfully!")
                        promise(.success(()))
                    }
                }
        }.eraseToAnyPublisher()
    }

    func updateUser(user: AppUser) -> AnyPublisher<Void, Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            guard let data = try? JSONEncoder().encode(user) else { return }
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }

            self.db.collection(self.DATABASE_NAME).document(user.id)
                .updateData(json) { error in
                    if let error {
                        LogE("FirestoreManager :: \(#function) : Updating document failed with error: \(error.localizedDescription).")
                        promise(.failure(error))
                    } else {
                        LogD("FirestoreManager :: \(#function) : Document updated successfully!")
                        promise(.success(()))
                    }
                }
        }.eraseToAnyPublisher()
    }

    func deleteUser(id: String) -> AnyPublisher<Void, Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            self.db.collection(self.DATABASE_NAME).document(id)
                .delete { error in
                    if let error {
                        LogE("FirestoreManager :: \(#function): Deleting collection failed with error: \(error.localizedDescription).")
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }
        }.eraseToAnyPublisher()
    }

    func fetchUsers() -> AnyPublisher<[AppUser], ServiceError> {
        var users: [AppUser] = []

        return Future { [weak self] promise in
            guard let self = self else { return }
            self.db.collection(self.DATABASE_NAME)
                .getDocuments { (snapshot, error) in
                    guard error == nil else {
                        LogE("FirestoreManager :: \(#function) error: \(String(describing: error?.localizedDescription))")
                        return
                    }
                    if let snapshot {
                        for document in snapshot.documents {
                            do {
                                let data = try JSONSerialization.data(withJSONObject: document.data(), options: .prettyPrinted)
                                let res = try JSONDecoder().decode(AppUser.self, from: data)
                                users.append(res)
                            } catch let error {
                                LogE("FirestoreManager :: \(#function) Decode error: \(error.localizedDescription)")
                                promise(.failure(.serverError()))
                            }
                        }
                    } else {
                        LogE("FirestoreManager :: \(#function) The document is not available.")
                        promise(.failure(.serverError()))
                    }
                    promise(.success(users))
                }
        }
        .eraseToAnyPublisher()
    }
}
