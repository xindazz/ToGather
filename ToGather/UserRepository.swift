//
//  UserRepository.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/27/22.
//

import Combine
// import Firebase modules here
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class UserRepository: ObservableObject {
  // Set up properties here
  private let path: String = "User"
  private let store = Firestore.firestore()
  private var userId: String = "XO7vnm5hVStXqBYLUdQW" // Demo only

  @Published var user: User = User(name: "", handle: "", phone: "")
  private var errorMessage: String = ""
  private var cancellables: Set<AnyCancellable> = []
  
  
  init() {
    getUser(userId: self.userId)
  }

  func getUser(userId: String) {
    // Complete this function
    let docRef = store.collection(path).document(userId)

    docRef.getDocument { document, error in
      if let error = error as NSError? {
        self.errorMessage = "Error getting document: \(error.localizedDescription)"
      }
      else {
        if let document = document {
          do {
            self.user = try document.data(as: User.self)
          }
          catch {
            print(error)
          }
        }
      }
    }
  }
}

