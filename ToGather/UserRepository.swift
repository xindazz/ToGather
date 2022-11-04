//
//  UserRepository.swift
//  ToGather
//
//  Created by Xinda Zhou on 10/27/22.
//

import Combine
import CoreData
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepository: ObservableObject {
  // Set up properties here
  private let db = Firestore.firestore()
  private var userId: String = "SIHsxbJlAHG4yJLoIeZS" // Demo only

  @Published var user: User = User(name: "")
  @Published var trips: [Trip] = []
  private var errorMessage: String = ""
  private var cancellables: Set<AnyCancellable> = []
  
  
  init() {
//    userId = setUser(name: "Bob", handle: "@12345")
    getUser(userId: userId)
  }
  
  func getUser(userId: String) {
    // Complete this function
    let docRef = db.collection("User").document(userId)
    docRef.getDocument { document, error in
      if let error = error as NSError? {
        self.errorMessage = "Error getting user document: \(error.localizedDescription)"
      }
      else {
        if let document = document {
          do {
            self.user = try document.data(as: User.self)
            self.getTrips(tripRefs: self.user.trips)
          }
          catch {
            print("Error decoding user \(error)")
          }
        }
      }
    }
  }
  
  func setUser(name: String, handle: String?) -> String {
    // Add a new document with a generated id.
    var ref: DocumentReference? = nil
    ref = db.collection("User").addDocument(data: [
        "name": name,
        "handle": handle ?? ""
    ]) { err in
        if let err = err {
            print("Error adding user: \(err)")
        } else {
            print("User added with ID: \(ref!.documentID)")
        }
    }
    return ref!.documentID
  }
  
  func getTrips(tripRefs: [DocumentReference]) {
    for tripRef in tripRefs {
      tripRef.getDocument { document, error in
        if let error = error as NSError? {
          self.errorMessage = "Error getting document: \(error.localizedDescription)"
        }
        else {
          if let document = document {
            do {
              let trip = try document.data(as: Trip.self)
              self.trips.append(trip)
              print("Got trip \(trip.name)")
            }
            catch {
              print("Error decoding trip data: \(error)")
            }
          }
        }
      }
    }
  }
  
  func createTrip(trip: Trip) {
    let collectionRef = db.collection("Trip")
      do {
        let ref = try collectionRef.addDocument(from: trip)
        print("Successfully added new trip \(trip.name)")
        self.user.trips.append(ref)
      }
      catch {
        print("Error adding new trip \(error)")
      }
  }
  
  func updateTrip(trip: Trip) {
    if let id = trip.id {
      let ref = db.collection("Trip").document(id)
      do {
        try ref.setData(from: trip)
      }
      catch {
        print(error)
      }
    }
  }
}

